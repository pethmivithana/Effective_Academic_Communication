import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/in_class_activity_screen.dart';

class SummaryScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const SummaryScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  bool _isPaused = false;

  List<String> _sentences = [];
  int _currentSentenceIndex = -1;

  @override
  void initState() {
    super.initState();
    _setupTts();
    if (widget.unitData != null && widget.unitData!.summary.isNotEmpty) {
      _sentences = widget.unitData!.summary.split(RegExp(r'(?<=[.!?])\s+'));
    }
  }

  void _setupTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.setPitch(1.0);

    _flutterTts.setCompletionHandler(() async {
      if (_currentSentenceIndex + 1 < _sentences.length) {
        _speakNextParagraph(_currentSentenceIndex + 1);
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

  Future<void> _speakNextParagraph(int index) async {
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
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null || unit.summary.isEmpty
          ? const Center(
        child: Text(
          "No summary available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Lesson Summary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 8,
                  children: List.generate(_sentences.length, (index) {
                    final sentence = _sentences[index];
                    final isActive = index == _currentSentenceIndex;

                    return GestureDetector(
                      onTap: () => _speakNextParagraph(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isActive ? const Color(0xFFFFE0B2) : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isActive ? const Color(0xFFFF6100) : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          sentence,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                            color: isActive ? const Color(0xFF010066) : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: "Play",
                  child: IconButton(
                    icon: const Icon(Icons.play_circle_fill, size: 36, color: Color(0xFF010066)),
                    onPressed: () {
                      if (_sentences.isNotEmpty) {
                        _speakNextParagraph(0);
                      }
                    },
                  ),
                ),
                Tooltip(
                  message: "Pause/Resume",
                  child: IconButton(
                    icon: const Icon(Icons.pause_circle_filled, size: 36, color: Colors.amber),
                    onPressed: _pauseOrResumeSpeech,
                  ),
                ),
                Tooltip(
                  message: "Stop",
                  child: IconButton(
                    icon: const Icon(Icons.stop_circle, size: 36, color: Colors.red),
                    onPressed: _stopSpeaking,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _flutterTts.stop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InClassActivityScreen(
                      unitIndex: widget.unitIndex,
                      subunitIndex: widget.subunitIndex,
                      subunitTitle: widget.subunitTitle,
                      unitData: widget.unitData,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: const Text(
                "Next: In-Class Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010066),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
