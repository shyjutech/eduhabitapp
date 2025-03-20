import 'package:eduhabit/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const OnBoardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Skip"),
            ),
          ),
          SvgPicture.asset(
            image,
            width: 200,
            height: 450,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppThemes.lightTheme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: AppThemes.lightTheme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
