import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/pre_class_activity_screen.dart';

class IntroductionScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const IntroductionScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final FlutterTts flutterTts = FlutterTts();
  List<String> paragraphs = [];
  int highlightedParagraphIndex = -1;
  bool isPlaying = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    if (widget.unitData != null && widget.unitData!.introductionText.isNotEmpty) {
      paragraphs = widget.unitData!.introductionText
          .split('\n')
          .where((para) => para.trim().isNotEmpty)
          .toList();
    }
    _setupTts();
  }

  void _setupTts() {
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.4);
    flutterTts.setPitch(1.0);

    flutterTts.setCompletionHandler(() {
      if (highlightedParagraphIndex + 1 < paragraphs.length) {
        _speakNextParagraph(highlightedParagraphIndex + 1);
      } else {
        setState(() {
          highlightedParagraphIndex = -1;
          isPlaying = false;
          isPaused = false;
        });
      }
    });
  }

  void _speakNextParagraph(int index) async {
    setState(() {
      highlightedParagraphIndex = index;
      isPlaying = true;
      isPaused = false;
    });
    await flutterTts.speak(paragraphs[index]);
  }

  Future<void> _stopSpeaking() async {
    await flutterTts.stop();
    setState(() {
      isPlaying = false;
      isPaused = false;
      highlightedParagraphIndex = -1;
    });
  }

  Future<void> _pauseOrResumeSpeaking() async {
    if (isPlaying && !isPaused) {
      await flutterTts.pause();
      setState(() {
        isPaused = true;
      });
    } else if (isPlaying && isPaused) {
      await flutterTts.speak(paragraphs[highlightedParagraphIndex]);
      setState(() {
        isPaused = false;
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unitName = widget.unitData?.unitName ?? widget.subunitTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          unitName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF010066),
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📘 Introduction",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF010066),
                ),
              ),
              const SizedBox(height: 12),

              if (widget.unitData == null || widget.unitData!.introductionText.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      '🧐 No introduction content available.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: paragraphs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final para = paragraphs[index];
                      final isHighlighted = index == highlightedParagraphIndex;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isHighlighted ? Colors.orange.shade100 : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: isHighlighted
                              ? Border.all(color: Colors.orange, width: 1.5)
                              : Border.all(color: Colors.grey.shade300),
                          boxShadow: isHighlighted
                              ? [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ]
                              : [],
                        ),
                        child: Text(
                          para,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: "Play",
                    child: IconButton(
                      icon: const Icon(Icons.play_circle_fill, size: 36, color: Color(0xFF010066)),
                      onPressed: () {
                        if (paragraphs.isNotEmpty) {
                          _speakNextParagraph(0);
                        }
                      },
                    ),
                  ),
                  Tooltip(
                    message: isPaused ? "Resume" : "Pause",
                    child: IconButton(
                      icon: Icon(
                        isPaused ? Icons.play_arrow : Icons.pause_circle_filled,
                        size: 36,
                        color: Colors.amber,
                      ),
                      onPressed: _pauseOrResumeSpeaking,
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

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010066),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 2,
                  ),
                  onPressed: () async {
                    await flutterTts.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreClassActivityScreen(
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
                    "Next: Pre-Class Activity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
