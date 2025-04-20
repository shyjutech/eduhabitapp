import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By continuing, you agree to our ',
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' View and ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: 'Privacy Policy.',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
