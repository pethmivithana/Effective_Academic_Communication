import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show LaunchMode, launchUrl;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/quiz_screen.dart';

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

class _PracticeActivityScreen2State extends State<PracticeActivityScreen2> {
  YoutubePlayerController? _youtubeController;
  List<TextEditingController> _controllers = [];
  bool submitted = false;
  bool showErrors = false;

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
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
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
    if (_controllers.any((c) => c.text.trim().isEmpty)) {
      setState(() => showErrors = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all answers."), backgroundColor: Colors.red),
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
                child: Text(
                  unit.practiceActivityDescription2,
                  style: const TextStyle(fontSize: 16, height: 1.6),
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
                      final isCorrect = submitted && controller.text.trim() == question.correctAnswer;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
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
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  isCorrect
                                      ? "✓ Correct!"
                                      : "✗ Incorrect. The correct answer is: ${question.correctAnswer}",
                                  style: TextStyle(
                                    color: isCorrect ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),

            if (unit.practiceActivityQuestions2 != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton.icon(
                  onPressed: _handleSubmit,
                  icon: const Icon(Icons.check),
                  label: const Text("Submit Answers"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

            if (hasLink)
              ElevatedButton.icon(
                onPressed: () => _launchURL(unit.practiceActivityLink2!),
                icon: const Icon(Icons.language),
                label: const Text("Go to Task Site"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

            if (hasUploadLink)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(unit.practiceUploadLink2!),
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Upload Your Answer"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
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
              },
              icon: const Icon(Icons.quiz, color: Colors.white), // White icon color
              label: const Text(
                "Go to Quiz",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // White font color
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010066),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}