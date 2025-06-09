import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show LaunchMode, launchUrl;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/quiz_screen.dart';
import 'dart:math' as math;

class PracticeQuestion2 {
  final String questionText;
  final String correctAnswer;

  PracticeQuestion2({required this.questionText, required this.correctAnswer});
}

class PracticeActivityScreen2 extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const PracticeActivityScreen2({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  State<PracticeActivityScreen2> createState() => _PracticeActivityScreen2State();
}

class _PracticeActivityScreen2State extends State<PracticeActivityScreen2> with TickerProviderStateMixin {
  YoutubePlayerController? _youtubeController;
  List<TextEditingController> _controllers = [];
  List<String?> selectedAnswers = [];
  bool submitted = false;
  bool showErrors = false;

  // TTS related variables
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;
  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  // Congratulatory messages
  final List<String> congratulatoryMessages = [
    "You're almost there! Keep up the excellent work! 🌟",
    "Amazing progress! You're so close to completing this unit! 🚀",
    "Outstanding effort! Just one more step to go! 💪",
    "Fantastic job! You're nearly at the finish line! 🏆",
    "Incredible work! The final challenge awaits! ✨",
    "Brilliant progress! You're almost done with this unit! 🎯"
  ];

  @override
  void initState() {
    super.initState();

    final videoUrl = widget.unitData?.practiceVideoUrl;
    if (videoUrl != null && videoUrl.isNotEmpty) {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId != null) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
        );
      }
    }

    if (widget.unitData?.practiceActivityQuestions2 != null) {
      _controllers = List.generate(
        widget.unitData!.practiceActivityQuestions2!.length,
            (_) => TextEditingController(),
      );
    }

    // Initialize selected answers for MCQs
    if (widget.unitData?.practiceActivityMCQ2 != null) {
      selectedAnswers = List<String?>.filled(widget.unitData!.practiceActivityMCQ2!.length, null);
    }

    // Setup TTS for description
    final unit = widget.unitData;
    if (unit != null && unit.practiceActivityDescription2.isNotEmpty) {
      _sentences = unit.practiceActivityDescription2.split(RegExp(r'(?<=[.!?])\s+'));
      _setupTts();
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

  String getRandomCongratulatoryMessage() {
    final random = math.Random();
    return congratulatoryMessages[random.nextInt(congratulatoryMessages.length)];
  }

  void _showCongratulatoryDialog() {
    final congratulatoryMessage = getRandomCongratulatoryMessage();

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) => Container(),
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        );

        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(
            opacity: animation,
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.transparent,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF010066),
                        Color(0xFF0066CC),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Animated icon
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 800),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.emoji_events,
                                color: Color(0xFF010066),
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // Title with animation
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 20 * (1 - value)),
                              child: const Text(
                                "You're Almost Complete!",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Message with animation
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 800),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 20 * (1 - value)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  congratulatoryMessage,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      // Button with animation
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 1000),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: ElevatedButton.icon(
                              onPressed: value == 1 ? () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreen(
                                      unitIndex: widget.unitIndex,
                                      subunitIndex: widget.subunitIndex,
                                      subunitTitle: widget.subunitTitle,
                                      unitData: widget.unitData,
                                    ),
                                  ),
                                );
                              } : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF010066),
                                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 5,
                              ),
                              icon: const Icon(Icons.quiz, size: 20),
                              label: const Text(
                                "Start Quiz",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    _flutterTts.stop();
    super.dispose();
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch URL: $url"), backgroundColor: Colors.red),
      );
    }
  }

  void _handleSubmit() {
    final hasQuestions = widget.unitData?.practiceActivityQuestions2 != null &&
        widget.unitData!.practiceActivityQuestions2!.isNotEmpty;
    final hasMCQs = widget.unitData?.practiceActivityMCQ2 != null &&
        widget.unitData!.practiceActivityMCQ2!.isNotEmpty;

    bool questionsAnswered = !hasQuestions || _controllers.every((c) => c.text.trim().isNotEmpty);
    bool mcqsAnswered = !hasMCQs || selectedAnswers.every((answer) => answer != null);

    if (!questionsAnswered || !mcqsAnswered) {
      setState(() => showErrors = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please answer all questions!"), backgroundColor: Colors.red),
      );
    } else {
      setState(() {
        submitted = true;
        showErrors = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Answers submitted!"), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.unitData;
    final hasVideo = unit?.practiceVideoUrl?.isNotEmpty ?? false;
    final hasLink = unit?.practiceActivityLink2?.isNotEmpty ?? false;
    final hasUploadLink = unit?.practiceUploadLink2?.isNotEmpty ?? false;
    final hasMCQs = unit?.practiceActivityMCQ2 != null && unit!.practiceActivityMCQ2!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subunitTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF010066),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null
          ? const Center(child: Text("No practice activity available."))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🔍 Practice Activity 2",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),
            if (unit.practiceActivityDescription2.isNotEmpty)
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
                                height: 1.6,
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

            const SizedBox(height: 20),

            if (hasVideo && _youtubeController != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Watch the Video",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: YoutubePlayer(
                      controller: _youtubeController!,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            if (unit.practiceActivityQuestions2 != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Answer the Questions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    unit.practiceActivityQuestions2!.length,
                        (index) {
                      final question = unit.practiceActivityQuestions2![index];
                      final controller = _controllers[index];
                      final isError = showErrors && controller.text.trim().isEmpty;

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
                                "Question ${index + 1}: ${question.questionText}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: "Enter your answer here",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: isError
                                          ? Colors.red
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: isError
                                          ? Colors.red
                                          : Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  errorText: isError ? "This field is required" : null,
                                ),
                                enabled: !submitted,
                              ),
                              if (submitted)
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
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

            // MCQ Section - Added from the first code
            if (hasMCQs)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Multiple Choice Questions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: unit.practiceActivityMCQ2!.length,
                    itemBuilder: (context, index) {
                      final mcq = unit.practiceActivityMCQ2![index];
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
                                    message: submitted && correct
                                        ? "This is the correct answer"
                                        : "",
                                    child: RadioListTile<String>(
                                      activeColor: submitted
                                          ? (correct ? Colors.green : Colors.red)
                                          : const Color(0xFF010066),
                                      title: Text(
                                        option,
                                        style: TextStyle(
                                          color: submitted
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
                                      onChanged: submitted
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
                ],
              ),

            if (unit.practiceActivityQuestions2 != null || hasMCQs)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton.icon(
                  onPressed: !submitted ? _handleSubmit : null,
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Submit Answers", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010066),
                    minimumSize: const Size(double.infinity, 50),
                    disabledBackgroundColor: Colors.grey,
                  ),
                ),
              ),

            if (hasLink)
              ElevatedButton.icon(
                onPressed: () => _launchURL(unit.practiceActivityLink2!),
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
                  onPressed: () => _launchURL(unit.practiceUploadLink2!),
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text("Upload Your Answer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                _flutterTts.stop(); // Stop TTS when navigating away
                _showCongratulatoryDialog(); // Show popup before navigation
              },
              icon: const Icon(Icons.quiz, color: Colors.white),
              label: const Text(
                "End Lesson Quiz",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}