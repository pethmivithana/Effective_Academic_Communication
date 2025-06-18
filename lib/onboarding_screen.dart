import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final box = GetStorage();

  void completeOnboarding() {
    box.write('first_time', false); // Mark onboarding as completed
    Navigator.pushReplacementNamed(context, '/login'); // Redirect to login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              buildPage(
                image: 'assets/onboarding/ob1.jpg',
                title: """🎙️Your Voice Matters. Let’s Make It Heard.""",
              description:
              """Welcome to Effective Academic Communication — the space where your ideas gain structure 🧱, strength 💪, and purpose 🎯. Every great communicator starts here. Start building essential communication skills for academic and professional success.""",
              ),
              buildPage(
                  image: 'assets/onboarding/ob5.png',
                  title: '👂 Listen, Laugh & Learn!',
                  description:
                  """Who said grammar and pronunciation have to be boring? 🤓🎉 We've packed this app with hilarious examples, fun challenges, and real-world practice. Get ready to laugh and learn! 😆📚""",
              ),
            ],
          ),

          // Smooth Page Indicator
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ),

          // Skip Button
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: completeOnboarding,
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),

          // Next Button
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                if (_controller.page == 1) {
                  completeOnboarding(); // On last page, complete onboarding
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      {required String image,
        required String title,
        required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}