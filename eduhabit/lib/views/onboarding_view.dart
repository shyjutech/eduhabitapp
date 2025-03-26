import 'package:eduhabit/widgets/custom_expanded_button.dart';
import 'package:eduhabit/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Build Great Habits, One Day at a Time!",
      "description":
          "Start your journey towards success with small actions. Track progress.",
      "image":
          "assets/images/Self-reflection 1.svg", // Replace with actual image path
    },
    {
      "title": "Stay Consistent With Streaks",
      "description":
          "Turn habits into powerful streaks. Stay motivated by tracking your progress.",
      "image":
          "assets/images/Coloring (1) 1.svg", // Replace with actual image path
    },
    {
      "title": "Never Miss a Habit Again!",
      "description":
          "Set reminders and get nudges to stay on track. Stay focused without distractions.",
      "image":
          "assets/images/Stress relief meditation 1.svg", // Replace with actual image path
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Navigate to the main app or perform another action
      // print("Onboarding complete!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnBoardingWidget(
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                  image: onboardingData[index]["image"]!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          CustomExpandedButton(
            buttonText: _currentPage == onboardingData.length - 1
                ? "Get Started"
                : "Next",
            onPressed: _nextPage,
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
