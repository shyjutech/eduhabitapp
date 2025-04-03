import 'package:eduhabit/themes/app_theme.dart';
import 'package:eduhabit/widgets/custom_button_widget.dart';
import 'package:eduhabit/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0; // Track the current page index

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => _controller.jumpToPage(2),
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppTheme.primaryDefault,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                OnboardingWidget(
                  title: "Build Great Habits, One Day at a Time!",
                  description:
                  "Start your journey towards success with small actions. Track progress.",
                  imageAsset: "assets/images/Self-reflection 1.svg",
                ),
                OnboardingWidget(
                  title: "Stay Consistent With Streaks",
                  description:
                  "Turn habits into powerful streaks. Stay motivated by tracking your progress.",
                  imageAsset: "assets/images/Coloring (1) 1.svg",
                ),
                OnboardingWidget(
                  title: "Never Miss a Habit Again!",
                  description:
                  "Set reminders and get nudges to stay on track. Stay focused without distractions.",
                  imageAsset: "assets/images/Stress relief meditation 1.svg",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: Color.fromRGBO(70, 123, 255, 1),
                    dotColor: Color.fromRGBO(70, 123, 255, 0.5),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomButtonWidget(
                  onPressed: () {
                    if (_currentPage == 2) {
                      // Navigate to home or main screen
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  label: _currentPage == 2 ? "Get Started" : "Next",
                  backgroundColor: AppTheme.primaryDefault,
                  labelColor: AppTheme.onPrimary,
                ),
                SizedBox(
                  height: size.height * 0.01,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
