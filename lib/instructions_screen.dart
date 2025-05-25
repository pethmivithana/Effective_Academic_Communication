import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/practice_activity_screen_1.dart';

class InstructionsScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const InstructionsScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  // TTS related variables
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;
  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  @override
  void initState() {
    super.initState();

    // Setup TTS for instructions
    final unit = widget.unitData;
    if (unit != null && unit.instructionsText.isNotEmpty) {
      _sentences = unit.instructionsText.split(RegExp(r'(?<=[.!?])\s+'));
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

  Future<void> _launchVideoUrl(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open video link'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.unitData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subunitTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF010066),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null || unit.instructionsText.isEmpty
          ? const Center(
        child: Text(
          "No instructions available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + Title
            Row(
              children:  [
                const Text(
                  "💡 Instructions",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010066),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Instructions Card with TTS
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
                  // Interactive sentence display
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

            const SizedBox(height: 30),

            // Video Button (if available)
            if (unit.instructionVideoId != null && unit.instructionVideoId!.isNotEmpty) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _launchVideoUrl(unit.instructionVideoId!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 3,
                  ),
                  icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                  label: const Text(
                    "See Instructional Video",
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _flutterTts.stop(); // Stop TTS when navigating away
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PracticeActivityScreen(
                        unitIndex: widget.unitIndex,
                        subunitIndex: widget.subunitIndex,
                        subunitTitle: widget.subunitTitle,
                        unitData: widget.unitData,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF010066),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 3,
                ),
                icon: const Icon(Icons.book_online, color: Colors.white),
                label: const Text(
                  "Next: Practice Activity",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}