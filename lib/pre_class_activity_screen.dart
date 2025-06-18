import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

  // Upload button state management
  bool hasUploadButtonBeenClicked = false;

  // Enhanced TTS variables
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;
  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  @override
  void initState() {
    super.initState();
    _setupTts();

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

      // Setup TTS for description
      if (unit.preClassActivityDescription.isNotEmpty) {
        // Remove ** markers and split into sentences
        String cleanText = unit.preClassActivityDescription.replaceAll(RegExp(r'\*\*(.*?)\*\*'), r'$1');
        _sentences = cleanText.split(RegExp(r'(?<=[.!?])\s+'));
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

  void _setupTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    _flutterTts.setCompletionHandler(() async {
      if (_currentSentenceIndex + 1 < _sentences.length) {
        _speakNextSentence(_currentSentenceIndex + 1);
      } else {
        setState(() {
          _isSpeaking = false;
          _currentSentenceIndex = -1;
        });
      }
    });

    _flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });
  }

  Future<void> _speakNextSentence(int index) async {
    if (index >= 0 && index < _sentences.length) {
      await _flutterTts.stop();
      setState(() {
        _currentSentenceIndex = index;
        _isPaused = false;
      });
      await _flutterTts.speak(_sentences[index]);
    }
  }

  Future<void> _pauseOrResumeSpeech() async {
    if (_isSpeaking) {
      await _flutterTts.pause();
      setState(() {
        _isSpeaking = false;
        _isPaused = true;
      });
    } else if (_isPaused) {
      await _flutterTts.speak(_sentences[_currentSentenceIndex]);
      setState(() {
        _isSpeaking = true;
        _isPaused = false;
      });
    }
  }

  Future<void> _stopSpeaking() async {
    await _flutterTts.stop();
    setState(() {
      _isSpeaking = false;
      _isPaused = false;
      _currentSentenceIndex = -1;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
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

  // Modified _launchURL method to handle upload button state
  void _launchURL(String url, {bool isUploadButton = false}) async {
    final Uri uri = Uri.parse(url);

    // If this is an upload button, mark it as clicked
    if (isUploadButton) {
      setState(() {
        hasUploadButtonBeenClicked = true;
      });
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch the link."), backgroundColor: Colors.red),
      );
    }
  }

  // Helper function to detect and style bold text
  Widget _buildRichText(String text) {
    // Regular expression to find text between ** markers
    final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*');

    // Find all matches
    final matches = boldPattern.allMatches(text);

    // If no bold text is found, return regular text
    if (matches.isEmpty) {
      return Text(text, style: const TextStyle(fontSize: 15));
    }

    // Build rich text with styled spans
    final List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in matches) {
      // Add text before the bold part
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: const TextStyle(fontSize: 15),
        ));
      }

      // Add the bold text without the ** markers
      spans.add(TextSpan(
        text: match.group(1), // This gets the text between ** markers
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF010066), // Using the app's primary color for bold text
        ),
      ));

      lastIndex = match.end;
    }

    // Add any remaining text after the last bold part
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: const TextStyle(fontSize: 15),
      ));
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black), // Default text style
        children: spans,
      ),
    );
  }

  // Enhanced description widget with interactive TTS
  Widget _buildInteractiveDescription(String text) {
    // Clean text for sentence splitting (remove ** markers)
    String cleanText = text.replaceAll(RegExp(r'\*\*(.*?)\*\*'), r'$1');
    List<String> cleanSentences = cleanText.split(RegExp(r'(?<=[.!?])\s+'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Interactive sentence display
        Wrap(
          spacing: 4,
          runSpacing: 8,
          children: List.generate(cleanSentences.length, (index) {
            final sentence = cleanSentences[index];
            final isActive = index == _currentSentenceIndex;

            return GestureDetector(
              onTap: () => _speakNextSentence(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFFFE0B2) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isActive ? const Color(0xFFFF6100) : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  sentence,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? const Color(0xFF010066) : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 12),

        // TTS Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: "Play from beginning",
              child: IconButton(
                icon: const Icon(Icons.play_circle_fill, size: 32, color: Color(0xFF010066)),
                onPressed: () {
                  if (_sentences.isNotEmpty) {
                    _speakNextSentence(0);
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Tooltip(
              message: "Pause/Resume",
              child: IconButton(
                icon: const Icon(Icons.pause_circle_filled, size: 36, color: Colors.amber),
                onPressed: _pauseOrResumeSpeech,
              ),
            ),
            const SizedBox(width: 8),
            Tooltip(
              message: "Stop",
              child: IconButton(
                icon: const Icon(Icons.stop_circle, size: 32, color: Colors.red),
                onPressed: _stopSpeaking,
              ),
            ),
          ],
        ),
      ],
    );
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
              _buildRichText(question.description!), // Use rich text for description
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
                    title: _buildRichText(option), // Use rich text for options
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
                    title: _buildRichText(option), // Use rich text for options
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
                    title: _buildRichText(optionText), // Use rich text for options
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

  // Helper method to check if upload buttons exist
  bool hasUploadButtons() {
    final unit = widget.unitData;
    return (unit?.preClassActivityUploadLink != null && unit!.preClassActivityUploadLink!.isNotEmpty);
  }

  // Helper method to determine if Next button should be shown
  bool shouldShowNextButton() {
    // If there are no upload buttons, show the Next button normally
    if (!hasUploadButtons()) {
      return true;
    }

    // If there are upload buttons, only show Next button after upload button is clicked
    return hasUploadButtonBeenClicked;
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
                  const SizedBox(height: 12),
                  _buildInteractiveDescription(unit.preClassActivityDescription),
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
                  _buildRichText(unit.preClassActivityDescription), // Use rich text for description
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
                    onPressed: () => _launchURL(unit.preClassActivityUploadLink!, isUploadButton: true),
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
                  onPressed: () => _launchURL(unit.preClassActivityUploadLink!, isUploadButton: true),
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

            // Next Button - only show when conditions are met
            if (shouldShowNextButton())
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
                  _flutterTts.stop(); // Stop TTS when navigating away
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