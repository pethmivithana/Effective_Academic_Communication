import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/summary_screen.dart';

class QuizScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const QuizScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<QuizQuestion> quizQuestions;
  List<String?> selectedAnswers = [];
  bool showResults = false;
  String? errorMessage;
  String? quizDescription;

  // TTS related variables
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;
  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  @override
  void initState() {
    super.initState();
    quizQuestions = widget.unitData?.quizQuestions ?? [];
    selectedAnswers = List.filled(quizQuestions.length, null);
    quizDescription = widget.unitData?.quizDescription;

    // Setup TTS for description
    if (quizDescription != null && quizDescription!.isNotEmpty) {
      _sentences = quizDescription!.split(RegExp(r'(?<=[.!?])\s+'));
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

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  void uploadAnswers() {
    if (selectedAnswers.contains(null) || selectedAnswers.contains("")) {
      setState(() {
        errorMessage = "Please answer all questions before submitting.";
      });
      return;
    }

    setState(() {
      showResults = true;
      errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = quizQuestions.length;
    final answered =
        selectedAnswers.where((a) => a != null && a!.isNotEmpty).length;

    // Check if we should show description instead of quiz questions
    final bool hasDescription = quizDescription != null && quizDescription!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subunitTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF010066),
        centerTitle: true,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: widget.unitData == null || (quizQuestions.isEmpty && !hasDescription)
          ? const Center(
        child: Text(
          "No content available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Column(
        children: [
          if (errorMessage != null)
            Container(
              width: double.infinity,
              color: Colors.red.shade100,
              padding: const EdgeInsets.all(10),
              child: Text(
                errorMessage!,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          if (!hasDescription)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: LinearProgressIndicator(
                value: total == 0 ? 0 : answered / total,
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                    answered == total ? Colors.green : Colors.orange),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              hasDescription ? "📖 Lesson Content" : "🎯 End Lesson Quiz",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),
          ),
          Expanded(
            child: hasDescription
                ? SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: quizQuestions.length,
              itemBuilder: (context, index) {
                final question = quizQuestions[index];
                final isCorrect = question.options != null &&
                    selectedAnswers[index] ==
                        question.options![question.correctOptionIndex ?? 0];

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
                          "Q${index + 1}: ${question.question}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        if (question.description != null &&
                            question.description!.isNotEmpty)
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 6.0, bottom: 12.0),
                            child: Text(
                              question.description!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ),
                        if (question.options != null)
                          ...question.options!.map((option) {
                            bool selected = selectedAnswers[index] == option;
                            bool correct = option ==
                                question.options![
                                question.correctOptionIndex ?? 0];

                            return Tooltip(
                              message: showResults && correct
                                  ? "This is the correct answer"
                                  : "",
                              child: RadioListTile<String>(
                                activeColor: showResults
                                    ? (correct ? Colors.green : Colors.red)
                                    : const Color(0xFF010066),
                                title: Text(
                                  option,
                                  style: TextStyle(
                                    color: showResults
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
                                onChanged: showResults
                                    ? null
                                    : (value) {
                                  setState(() {
                                    selectedAnswers[index] = value;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        if (question.isTextAnswer)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  selectedAnswers[index] = value;
                                },
                                decoration: const InputDecoration(
                                  labelText: "Your Answer",
                                  border: OutlineInputBorder(),
                                ),
                                enabled: !showResults,
                              ),
                              if (showResults &&
                                  question.correctTextAnswer != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Correct Answer: ${question.correctTextAnswer}",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(  // Changed from Row to Column to prevent overflow
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!hasDescription)
                  ElevatedButton.icon(
                    onPressed: showResults ? null : uploadAnswers,
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                    label: const Text("Submit Answers"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF010066),
                      foregroundColor: Colors.white,
                      iconColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      minimumSize: const Size(double.infinity, 50),  // Changed to take full width
                    ),
                  ),
                if (!hasDescription && showResults)
                  const SizedBox(height: 16),  // Changed from width to height
                if (hasDescription || showResults)
                  ElevatedButton.icon(
                    onPressed: () {
                      _flutterTts.stop(); // Stop TTS when navigating away
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SummaryScreen(
                            unitIndex: widget.unitIndex,
                            subunitIndex: widget.subunitIndex,
                            subunitTitle: widget.subunitTitle,
                            unitData: widget.unitData,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.summarize, color: Colors.white),
                    label: const Text("Next: Summary"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF010066),
                      foregroundColor: Colors.white,
                      iconColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      minimumSize: const Size(double.infinity, 50),  // Changed to take full width
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}