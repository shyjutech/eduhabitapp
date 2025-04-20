import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupSigninPrompt extends StatelessWidget {
  const SignupSigninPrompt({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: Theme.of(context).textTheme.labelMedium,
          children: [
            TextSpan(
              text: text2,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.blue
                        : Colors.lightBlueAccent,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' here.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
