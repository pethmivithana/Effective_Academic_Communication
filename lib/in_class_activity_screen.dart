import 'package:flutter/material.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/homescreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:confetti/confetti.dart';
import 'dart:math' as math;

class InClassActivityScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const InClassActivityScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _InClassActivityScreenState createState() => _InClassActivityScreenState();
}

class _InClassActivityScreenState extends State<InClassActivityScreen> {
  final box = GetStorage();
  late ConfettiController _confettiController;

  final List<String> celebrationMessages = [
    "You're unstoppable! 🏆🚀",
    "Amazing progress! Keep shining! ✨💫",
    "Brilliant work! You're a star! 🌟👏",
    "Fantastic job! You're crushing it! 💪🔥",
    "Excellent! You're on a roll! 🎯🎓"
  ];

  String getRandomCelebrationMessage() {
    final random = math.Random();
    return celebrationMessages[random.nextInt(celebrationMessages.length)];
  }

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showCelebrationDialog() {
    final celebrationMessage = getRandomCelebrationMessage();
    _confettiController.play();

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) => Container(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
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
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirection: -math.pi / 2,
                        emissionFrequency: 0.05,
                        numberOfParticles: 20,
                        maxBlastForce: 20,
                        minBlastForce: 5,
                        gravity: 0.2,
                        colors: const [
                          Colors.blue,
                          Colors.green,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple,
                          Colors.yellow,
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF010066),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 60),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Another level unlocked!",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          celebrationMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          final username = box.read('username') ?? 'User';
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(username: username),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF010066),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                        ),
                        child: const Text(
                          "Finish",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
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
  Widget build(BuildContext context) {
    final unit = widget.unitData;
    final username = box.read('username') ?? 'User';

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
      body: unit == null || unit.inClassActivity.isEmpty
          ? const Center(
        child: Text(
          "No in-class activity available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📝 In-Class Activity",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF010066),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.menu_book_outlined, color: Colors.deepPurple),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            unit.inClassActivity,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                bool? confirm = await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation1, animation2) => Container(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionBuilder: (context, animation, secondaryAnimation, child) {
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutBack,
                    );

                    return ScaleTransition(
                      scale: curvedAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: const Text("Confirm Finish", style: TextStyle(fontWeight: FontWeight.bold)),
                          content: const Text("Are you sure you want to finish this activity?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("Cancel", style: TextStyle(fontSize: 16)),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              ),
                              child: const Text("Yes, Finish", style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

                if (confirm == true) {
                  _showCelebrationDialog();
                }
              },
              icon: const Icon(Icons.tab_sharp, color: Colors.white),
              label: const Text(
                "Finish Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010066),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
