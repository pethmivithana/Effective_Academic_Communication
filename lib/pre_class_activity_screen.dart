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
  List<TextEditingController> controllers = [];
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
      controllers = List.generate(
        unit.preClassQuestions?.length ?? 0,
            (_) => TextEditingController(),
      );

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
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void validateAnswers() {
    HapticFeedback.selectionClick();

    setState(() {
      allAnswered = controllers.every((c) => c.text.trim().isNotEmpty);
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
                    onPressed: () => _launchURL(unit.preClassActivityUploadLink!),
                    icon: const Icon(Icons.link),
                    label: const Text("Submit Your Answers"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  ),
                ],
              ),

            if (unit.preClassActivityUploadLink != null && unit.preClassActivityUploadLink!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(unit.preClassActivityUploadLink!),
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Upload Your Activity"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),


            if (_youtubeController != null)
              ExpansionTile(
                leading: const Icon(Icons.play_circle_fill),
                title: const Text("Watch Video", style: TextStyle(fontWeight: FontWeight.w600)),
                onExpansionChanged: (value) => setState(() => showVideo = value),
                children: [
                  if (_youtubeController != null)
                    YoutubePlayer(controller: _youtubeController!),
                  if (_localVideoController != null && _localVideoController!.value.isInitialized)
                    AspectRatio(
                      aspectRatio: _localVideoController!.value.aspectRatio,
                      child: VideoPlayer(_localVideoController!),
                    ),
                  if (_localVideoController != null)
                    IconButton(
                      icon: Icon(
                        _localVideoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
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

            if (unit.preClassActivityLink != null && unit.preClassActivityLink!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(unit.preClassActivityLink!),
                  icon: const Icon(Icons.open_in_browser),
                  label: const Text("Submit Your Answers"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),

            const SizedBox(height: 20),

            if (unit.preClassQuestions != null && unit.preClassQuestions!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("🧠 Answer These", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ListView.builder(
                    itemCount: unit.preClassQuestions!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final isAnswered = controllers[index].text.isNotEmpty;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isAnswered ? Colors.lightGreen.shade50 : Colors.grey.shade100,
                          border: Border.all(color: isAnswered ? Colors.green : Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Q${index + 1}: ${unit.preClassQuestions![index].questionText}",
                                style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            TextField(
                              controller: controllers[index],
                              enabled: !isSubmitted,
                              maxLines: null,
                              onChanged: (_) => setState(() {}),
                              decoration: const InputDecoration(
                                hintText: "Your answer...",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            if (isSubmitted)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue.shade50,
                                    border: Border.all(color: Colors.blue),
                                  ),
                                  child: Text(
                                    "✔️ Correct Answer: ${unit.preClassQuestions![index].correctAnswer}",
                                    style: const TextStyle(
                                        color: Colors.blue, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check, color: Colors.white, size: 20),
                    label: const Text("Submit Answers",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: validateAnswers,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6100),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_forward, size: 20, color: Colors.white),
              label: const Text(
                "Next : Instructions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: (isSubmitted == true || unit.preClassQuestions?.isEmpty != false)
                    ? const Color(0xFF010066)
                    : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: (isSubmitted == true || unit.preClassQuestions?.isEmpty != false)
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