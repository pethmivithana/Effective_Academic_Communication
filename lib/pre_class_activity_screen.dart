import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/instructions_screen.dart';

class PreClassActivityScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const PreClassActivityScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  State<PreClassActivityScreen> createState() => _PreClassActivityScreenState();
}

class _PreClassActivityScreenState extends State<PreClassActivityScreen> with TickerProviderStateMixin {
  List<TextEditingController> questionControllers = [];
  List<int?> mcqSelections = []; // Store selected index for MCQs
  List<List<bool>> surveySelections = [];
  bool isSubmitted = false;
  bool allAnswered = false;
  YoutubePlayerController? _youtubeController;
  VideoPlayerController? _localVideoController;
  bool showVideo = false;

  @override
  void initState() {
    super.initState();

    final unit = widget.unitData;
    if (unit != null) {
      // Initialize controllers for regular questions
      questionControllers = List.generate(
        unit.preClassQuestions?.length ?? 0,
            (_) => TextEditingController(),
      );

      // Initialize MCQ selections array
      mcqSelections = List.generate(
        unit.preClassQuestions?.length ?? 0,
            (_) => null, // null means nothing selected yet
      );

      // Initialize selections for survey questions
      if (unit.preClassSurvey != null) {
        surveySelections = List.generate(
          unit.preClassSurvey!.length,
              (index) {
            final optionsLength = unit.preClassSurvey![index].options?.length ?? 0;
            return List.filled(optionsLength, false);
          },
        );
      }

      // Initialize video controllers
      final videoUrl = unit.preClassActivityVideo;
      if (videoUrl != null && videoUrl.isNotEmpty) {
        final videoId = YoutubePlayer.convertUrlToId(videoUrl);
        if (videoId != null) {
          _youtubeController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
          );
        }
      }

      final localVideoPath = unit.preClassActivityLocalVideo;
      if (localVideoPath != null && localVideoPath.isNotEmpty) {
        _localVideoController = VideoPlayerController.asset(localVideoPath)
          ..initialize().then((_) {
            setState(() {});
          });
      }
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    _localVideoController?.dispose();
    for (var controller in questionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void validateAnswers() {
    HapticFeedback.selectionClick();

    bool regularQuestionsAnswered = true;

    // Check if all required questions are answered
    if (widget.unitData?.preClassQuestions != null) {
      for (int i = 0; i < widget.unitData!.preClassQuestions!.length; i++) {
        final question = widget.unitData!.preClassQuestions![i];

        // For text questions, check if there's content
        if (question.isTextAnswer) {
          if (questionControllers[i].text.trim().isEmpty) {
            regularQuestionsAnswered = false;
            break;
          }
        }
        // For MCQs, check if an option is selected
        else if (question.options != null && question.options!.isNotEmpty) {
          if (mcqSelections[i] == null) {
            regularQuestionsAnswered = false;
            break;
          }
        }
      }
    }

    // Check survey questions
    bool surveyQuestionsAnswered = true;
    if (widget.unitData?.preClassSurvey != null) {
      for (int i = 0; i < widget.unitData!.preClassSurvey!.length; i++) {
        // Skip text answer questions as they might be optional
        if (widget.unitData!.preClassSurvey![i].isTextAnswer) continue;

        // Check if at least one option is selected
        bool questionAnswered = surveySelections[i].any((selected) => selected);
        if (!questionAnswered) {
          surveyQuestionsAnswered = false;
          break;
        }
      }
    }

    setState(() {
      allAnswered = regularQuestionsAnswered && surveyQuestionsAnswered;
      if (!allAnswered) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please answer all questions."), backgroundColor: Colors.red),
        );
        return;
      }

      isSubmitted = true;
    });
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch the link."), backgroundColor: Colors.red),
      );
    }
  }

  Widget _buildSurveyQuestion(SurveyQuestion question, int surveyIndex) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Survey Q${surveyIndex + 1}: ${question.questionText}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Add description if available
            if (question.description != null) ...[
              const SizedBox(height: 8),
              Text(
                question.description!,
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],

            const SizedBox(height: 12),

            // Handle text answer type questions
            if (question.isTextAnswer)
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Enter your answer here...",
                  border: OutlineInputBorder(),
                ),
                enabled: !isSubmitted,
              )
            // Handle multiple choice questions with options
            else if (question.options != null && question.options!.isNotEmpty)
              if (question.allowsMultipleAnswers)
                ...question.options!.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  // Make sure surveySelections has the right dimensions
                  return CheckboxListTile(
                    title: Text(option),
                    value: surveyIndex < surveySelections.length &&
                        index < surveySelections[surveyIndex].length ?
                    surveySelections[surveyIndex][index] : false,
                    onChanged: isSubmitted
                        ? null
                        : (value) {
                      setState(() {
                        if (surveyIndex < surveySelections.length &&
                            index < surveySelections[surveyIndex].length) {
                          surveySelections[surveyIndex][index] = value!;
                        }
                      });
                    },
                  );
                }).toList()
              else
                ...question.options!.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  // Make sure surveySelections has the right dimensions
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: surveyIndex < surveySelections.length &&
                        index < surveySelections[surveyIndex].length &&
                        surveySelections[surveyIndex][index] ?
                    option : null,
                    onChanged: isSubmitted
                        ? null
                        : (value) {
                      setState(() {
                        if (surveyIndex < surveySelections.length) {
                          // Reset all options to false
                          surveySelections[surveyIndex] =
                              List.filled(question.options!.length, false);
                          // Set selected option to true
                          if (index < surveySelections[surveyIndex].length) {
                            surveySelections[surveyIndex][index] = true;
                          }
                        }
                      });
                    },
                  );
                }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(PreClassQuestion question, int index) {
    final bool isMCQ = !question.isTextAnswer && question.options != null && question.options!.isNotEmpty;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${index + 1}: ${question.questionText}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            // For MCQ questions
            if (isMCQ) ...[
              ...question.options!.asMap().entries.map((entry) {
                final optionIndex = entry.key;
                final optionText = entry.value;

                // Determine colors for MCQ options after submission
                Color? optionColor;
                if (isSubmitted) {
                  // Correct answer is highlighted green
                  if (optionIndex == question.correctOptionIndex) {
                    optionColor = Colors.green.shade100;
                  }
                  // Wrong selected answer is highlighted red
                  else if (mcqSelections[index] == optionIndex &&
                      optionIndex != question.correctOptionIndex) {
                    optionColor = Colors.red.shade100;
                  }
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: optionColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: mcqSelections[index] == optionIndex
                          ? const Color(0xFF010066)
                          : Colors.grey.shade300,
                      width: mcqSelections[index] == optionIndex ? 2 : 1,
                    ),
                  ),
                  child: RadioListTile<int>(
                    title: Text(optionText),
                    value: optionIndex,
                    groupValue: mcqSelections[index],
                    onChanged: isSubmitted
                        ? null
                        : (value) {
                      setState(() {
                        mcqSelections[index] = value;
                      });
                    },
                    dense: true,
                    activeColor: const Color(0xFF010066),
                  ),
                );
              }).toList(),

              // Show correct answer feedback after submission
              if (isSubmitted) ...[
                const Divider(height: 24),
                Row(
                  children: [
                    Icon(
                      question.correctOptionIndex == null || mcqSelections[index] == question.correctOptionIndex
                          ? Icons.check_circle
                          : Icons.cancel,
                      color: question.correctOptionIndex == null || mcqSelections[index] == question.correctOptionIndex
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        question.correctOptionIndex == null || mcqSelections[index] == question.correctOptionIndex
                            ? "Correct!"
                            : "Incorrect.",
                        style: TextStyle(
                          color: question.correctOptionIndex == null || mcqSelections[index] == question.correctOptionIndex
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ]
            // For text answer questions
            else ...[
              TextField(
                controller: questionControllers[index],
                enabled: !isSubmitted,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Enter your answer here...",
                  border: OutlineInputBorder(),
                ),
              ),

              // Show correct answer for text questions after submission
              if (isSubmitted && question.correctAnswer != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Correct Answer: ${question.correctAnswer}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  bool shouldShowSubmitButton() {
    final unit = widget.unitData;
    // Show submit button only if there are questions or survey questions
    return (unit?.preClassQuestions != null && unit!.preClassQuestions!.isNotEmpty) ||
        (unit?.preClassSurvey != null && unit!.preClassSurvey!.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.unitData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF010066),
        title: Text(widget.subunitTitle, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null
          ? const Center(child: Text("No pre-class activity available."))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📚 Pre Class Activity",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),
            const SizedBox(height: 16),
            if (isSubmitted)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Text("Activity submitted!", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "📝 Activity Overview",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    unit.preClassActivityDescription,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),



            // Local Video and Upload Button
            if (unit.preClassActivityLocalVideo != null &&
                unit.preClassActivityUploadLink != null &&
                unit.preClassActivityDescription.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unit.preClassActivityDescription,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  if (_localVideoController != null && _localVideoController!.value.isInitialized)
                    Column(
                      children: [
                        AspectRatio(
                          aspectRatio: _localVideoController!.value.aspectRatio,
                          child: VideoPlayer(_localVideoController!),
                        ),
                        IconButton(
                          icon: Icon(
                            _localVideoController!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          onPressed: () {
                            setState(() {
                              _localVideoController!.value.isPlaying
                                  ? _localVideoController!.pause()
                                  : _localVideoController!.play();
                            });
                          },
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.link, color: Colors.white),
                    label: const Text("Submit Your Answers", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () => _launchURL(unit.preClassActivityUploadLink!),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),

            // YouTube or Local Video
            if (_youtubeController != null)
              ExpansionTile(
                leading: const Icon(Icons.play_circle_fill),
                title: const Text("Watch Video", style: TextStyle(fontWeight: FontWeight.w600)),
                onExpansionChanged: (value) => setState(() => showVideo = value),
                children: [
                  YoutubePlayer(controller: _youtubeController!),
                ],
              ),

            const SizedBox(height: 16),

            // Pre-class Activity Link Button
            if (unit.preClassActivityLink != null && unit.preClassActivityLink!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.link, color: Colors.white,),
                  label: const Text("Go to Task Site", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () => _launchURL(unit.preClassActivityLink!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),

                  ),
                ),
              ),

            // Extra Upload Button
            if (unit.preClassActivityUploadLink != null && unit.preClassActivityUploadLink!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(unit.practiceUploadLink2!),
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text("Upload Your Answer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Regular Questions
            if (unit.preClassQuestions != null && unit.preClassQuestions!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "🧠 Answer The Questions Given",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF010066),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...unit.preClassQuestions!.asMap().entries.map((entry) {
                    final index = entry.key;
                    final question = entry.value;
                    return _buildQuestionCard(question, index);
                  }).toList(),
                ],
              ),

            const SizedBox(height: 20),

            // Survey Questions
            if (unit.preClassSurvey != null && unit.preClassSurvey!.isNotEmpty)
              Column(
                children: [
                  const Text(
                    "📊 Survey Questions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF010066),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...unit.preClassSurvey!.asMap().entries.map((entry) {
                    final index = entry.key;
                    final question = entry.value;
                    return _buildSurveyQuestion(question, index);
                  }).toList(),
                ],
              ),

            const SizedBox(height: 20),

            // Submit Button - only show if there are questions or survey
            if (!isSubmitted && shouldShowSubmitButton())
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text("Submit Activity",  style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: validateAnswers,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010066),
                    iconColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Next Button
            ElevatedButton.icon(
              icon: const Icon(Icons.integration_instructions, size: 20, color: Colors.white),
              label: const Text(
                "Next : Instructions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: (isSubmitted == true || !shouldShowSubmitButton())
                    ? const Color(0xFF010066)
                    : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: (isSubmitted == true || !shouldShowSubmitButton())
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstructionsScreen(
                      unitIndex: widget.unitIndex,
                      subunitIndex: widget.subunitIndex,
                      subunitTitle: widget.subunitTitle,
                      unitData: widget.unitData,
                    ),
                  ),
                );
              }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}