import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.icon,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: labelColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
