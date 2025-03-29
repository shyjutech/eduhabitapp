import 'dart:ui';

import 'package:eduhabit/themes/theme.dart';
import 'package:flutter/material.dart';

class GoogleSignupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStateProperty.all(
            BorderSide(color: Color(0xffA6A8AA), width: 1),
          ),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/search.png", cacheHeight: 15),
            Text(
              "Continue with Google",
              style:
                  Theme.of(context).brightness == Brightness.light
                      ? AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff121212),
                      )
                      : AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
