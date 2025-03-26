import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CustomExpandedButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const CustomExpandedButton({
    super.key,
    this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).brightness == Brightness.light
              ? AppThemes.lightTheme.elevatedButtonTheme.style
              : AppThemes.darkTheme.elevatedButtonTheme.style,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
