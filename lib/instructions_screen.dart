import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.unitData != null && widget.unitData!.instructionVideoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: widget.unitData!.instructionVideoId!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
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

            // Instructions Card
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
              child: Text(
                unit.instructionsText,
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            const SizedBox(height: 30),

            // YouTube Video Player (if available)
            if (_controller != null) ...[
              const Row(
                children: const [
                  Icon(Icons.play_circle_fill, size: 26, color: Colors.redAccent),
                  SizedBox(width: 8),
                  Text(
                    "Watch Instructional Video",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
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
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
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