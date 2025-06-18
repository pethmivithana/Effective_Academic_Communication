import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show LaunchMode, launchUrl;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/practice_activity_screen_2.dart';

class PracticeActivityScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const PracticeActivityScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _PracticeActivityScreenState createState() => _PracticeActivityScreenState();
}

class _PracticeActivityScreenState extends State<PracticeActivityScreen> {
  List<TextEditingController> controllers = [];
  List<String?> selectedAnswers = [];

  bool isSubmitted = false;
  bool allAnswered = false;
  YoutubePlayerController? _youtubeController;

  // Upload button state management
  bool hasUploadButtonBeenClicked = false;

  // TTS related variables
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;
  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  @override
  void initState() {
    super.initState();
    final unit = widget.unitData;

    if (unit != null) {
      if (unit.practiceActivityQuestions1 != null) {
        controllers = List.generate(
          unit.practiceActivityQuestions1!.length,
              (_) => TextEditingController(),
        );
      }

      if (unit.practiceActivityMCQ != null) {
        selectedAnswers = List<String?>.filled(unit.practiceActivityMCQ!.length, null);
      }

      if (unit.practiceActivityVideo != null &&
          unit.practiceActivityVideo!.isNotEmpty) {
        final videoId = YoutubePlayer.convertUrlToId(unit.practiceActivityVideo!);
        if (videoId != null) {
          _youtubeController = YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
          );
        }
      }

      // Setup TTS for description
      if (unit.practiceActivityDescription1.isNotEmpty) {
        _sentences = unit.practiceActivityDescription1.split(RegExp(r'(?<=[.!?])\s+'));
        _setupTts();
      }
    }
  }

  void _setupTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
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
    for (var controller in controllers) {
      controller.dispose();
    }
    _youtubeController?.dispose();
    _flutterTts.stop();
    super.dispose();
  }

  void validateAnswers() {
    final unit = widget.unitData;
    final hasQuestions = unit?.practiceActivityQuestions1 != null && unit!.practiceActivityQuestions1!.isNotEmpty;
    final hasMCQs = unit?.practiceActivityMCQ != null && unit!.practiceActivityMCQ!.isNotEmpty;

    bool questionsAnswered = !hasQuestions || controllers.every((controller) => controller.text.trim().isNotEmpty);
    bool mcqsAnswered = !hasMCQs || selectedAnswers.every((answer) => answer != null);

    setState(() {
      allAnswered = questionsAnswered && mcqsAnswered;

      if (!questionsAnswered || !mcqsAnswered) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please answer all questions!"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        isSubmitted = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Answers submitted!"),
            backgroundColor: Colors.green,
          ),
        );
      }
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

    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch URL: $url"), backgroundColor: Colors.red),
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
      return Text(text);
    }

    // Build rich text with styled spans
    final List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in matches) {
      // Add text before the bold part
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
        ));
      }

      // Add the bold text without the ** markers
      spans.add(TextSpan(
        text: match.group(1), // This gets the text between ** markers
        style: const TextStyle(
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
      ));
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black), // Default text style
        children: spans,
      ),
    );
  }

  // Helper method to check if upload buttons exist
  bool hasUploadButtons() {
    final unit = widget.unitData;
    return (unit?.practiceUploadLink != null && unit!.practiceUploadLink!.isNotEmpty);
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
    final hasLink = unit?.practiceActivityLink != null && unit!.practiceActivityLink!.isNotEmpty;
    final hasUploadLink = unit?.practiceUploadLink != null && unit!.practiceUploadLink!.isNotEmpty;
    final hasVideo = unit?.practiceActivityVideo != null && unit!.practiceActivityVideo!.isNotEmpty;
    final hasQuestions = unit?.practiceActivityQuestions1 != null && unit!.practiceActivityQuestions1!.isNotEmpty;
    final hasMCQs = unit?.practiceActivityMCQ != null && unit!.practiceActivityMCQ!.isNotEmpty;
    final canProceed = (hasQuestions || hasMCQs) ? isSubmitted : true;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subunitTitle, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF010066),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null
          ? const Center(child: Text("No practice activity available.", style: TextStyle(fontSize: 18, color: Colors.black)))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📝 Practice Activity 1",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),

            const SizedBox(height: 16),

            if (unit.practiceActivityDescription1.isNotEmpty)
              Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description text with highlighting for current sentence
                      Wrap(
                        spacing: 4,
                        runSpacing: 8,
                        children: List.generate(_sentences.length, (index) {
                          final sentence = _sentences[index];
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
                                  fontSize: 16,
                                  height: 1.4,
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
                  ),
                ),
              ),

            // Buttons section - Always visible if URLs are available
            if (hasLink)
              ElevatedButton.icon(
                onPressed: () => _launchURL(unit.practiceActivityLink!),
                icon: const Icon(Icons.language, color: Colors.white),
                label: const Text("Go to Task Site", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),

            if (hasUploadLink)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(unit.practiceUploadLink!, isUploadButton: true),
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text("Upload Your Answer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),

            if (hasVideo && _youtubeController != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: YoutubePlayer(
                  controller: _youtubeController!,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
                  ),
                ),
              ),

            if (hasQuestions)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: unit.practiceActivityQuestions1!.length,
                itemBuilder: (context, index) {
                  final question = unit.practiceActivityQuestions1![index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${index + 1}: ${question.questionText}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                              hintText: "Type your answer...",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                            enabled: !isSubmitted,
                          ),
                          if (isSubmitted)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Correct Answer: ${question.correctAnswer}",
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

            if (hasMCQs)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: unit.practiceActivityMCQ!.length,
                itemBuilder: (context, index) {
                  final mcq = unit.practiceActivityMCQ![index];
                  final isCorrect = mcq.options != null &&
                      selectedAnswers[index] ==
                          mcq.options![mcq.correctOptionIndex ?? 0];

                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${index + 1}: ${mcq.questionText}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          if (mcq.options != null)
                            ...mcq.options!.map((option) {
                              bool selected = selectedAnswers[index] == option;
                              bool correct = option ==
                                  mcq.options![mcq.correctOptionIndex ?? 0];

                              return Tooltip(
                                message: isSubmitted && correct
                                    ? "This is the correct answer"
                                    : "",
                                child: RadioListTile<String>(
                                  activeColor: isSubmitted
                                      ? (correct ? Colors.green : Colors.red)
                                      : const Color(0xFF010066),
                                  title: Text(
                                    option,
                                    style: TextStyle(
                                      color: isSubmitted
                                          ? (correct
                                          ? Colors.green
                                          : selected
                                          ? Colors.red
                                          : Colors.black)
                                          : Colors.black,
                                      fontWeight: selected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  value: option,
                                  groupValue: selectedAnswers[index],
                                  onChanged: isSubmitted
                                      ? null
                                      : (value) {
                                    setState(() {
                                      selectedAnswers[index] = value;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),

            if ((hasQuestions || hasMCQs) && !isSubmitted)
              ElevatedButton.icon(
                icon: const Icon(Icons.check, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF010066),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: validateAnswers,
                label: const Text("Submit Answers", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),

            // Next Button - only show when conditions are met
            if (canProceed && shouldShowNextButton())
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.local_activity_rounded, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010066),
                    iconColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    _flutterTts.stop(); // Stop TTS when navigating away
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticeActivityScreen2(
                          unitIndex: widget.unitIndex,
                          subunitIndex: widget.subunitIndex,
                          subunitTitle: widget.subunitTitle,
                          unitData: widget.unitData,
                        ),
                      ),
                    );
                  },
                  label: const Text("Next: Practice Activity 2", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}