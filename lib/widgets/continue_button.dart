import 'package:eduhabit/themes/theme.dart';
import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            Theme.of(context).brightness == Brightness.light
                ? ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.lightTheme.primaryColor,
                )
                : ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.darkTheme.primaryColor,
                ),
        child: Text(
          "Continue",
          style:
              Theme.of(context).brightness == Brightness.light
                  ? AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                  : AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
        ),
      ),
    );
  }
}
