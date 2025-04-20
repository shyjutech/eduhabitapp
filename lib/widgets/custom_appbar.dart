import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// Implementing PreferredSizeWidget is crucial for AppBars
// It tells the Scaffold the height the AppBar wants to occupy.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Optional actions (like icons on the right)
  final Color? backgroundColor; // Optional custom background color
  final Color? foregroundColor; // Optional custom text/icon color
final bool showBackButton;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
      this.showBackButton = true, 
    this.backgroundColor, // Default will be taken from theme
    this.foregroundColor, // Default will be taken from theme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the current route can be popped (i.e., if there's a screen to go back to)
    final bool canPop = Navigator.canPop(context);

    return AppBar(
      // Use theme's AppBar theme by default, but allow overrides
      backgroundColor: backgroundColor, // Uses theme color if null
      foregroundColor: foregroundColor, // Uses theme color if null
      elevation: 0, // Common practice for a cleaner look, adjust as needed
      surfaceTintColor: Colors.transparent, // Prevents color tinting on scroll

      // --- Leading Back Arrow ---
      // Show back arrow only if navigation is possible
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back), // Standard back arrow
              tooltip: MaterialLocalizations.of(context).backButtonTooltip, // Accessibility
              onPressed: () {
                // Navigate back when tapped
                Navigator.pop(context);
              },
            )
          : null, // No leading icon if it's the first screen

      // --- Title ---
      title: Text(title), // Display the title passed to the widget
      centerTitle: false, // Android style (false) or iOS style (true)

      // --- Optional Actions ---
      actions: actions, // Add any action widgets if provided
    );
  }

  // --- Required by PreferredSizeWidget ---
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // kToolbarHeight is the default AppBar height in Flutter
}