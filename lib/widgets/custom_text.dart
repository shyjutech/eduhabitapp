import 'package:flutter/material.dart';

// A reusable text widget that defaults to Montserrat font.
class CustomText extends StatelessWidget {
  final String text; // The text content to display (required)
  final Color textcolor; // Required text color (consider making optional or renaming)

  // Optional styling parameters
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color; // Optional specific color (takes precedence over textcolor if provided)
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText(
    this.text, { // Make the text the first positional argument
    Key? key,
    // Note: Having both 'color' and 'textcolor' can be confusing.
    // Consider using only 'color' and making it optional.
    // Keeping 'textcolor' required as per your original code for now.
    required this.textcolor,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // --- Determine the final text style ---

    // 1. Start with the provided style or the default text style from the theme.
    final TextStyle baseStyle = style ?? DefaultTextStyle.of(context).style;

    // 2. Apply explicit overrides and the default font family.
    //    'copyWith' creates a new style based on 'baseStyle'.
    final TextStyle effectiveStyle = baseStyle.copyWith(
      // --- Default Font Family ---
      // Apply 'Montserrat' ONLY IF baseStyle doesn't already have a fontFamily.
      // If 'style' was provided and had a fontFamily, that one will be kept.
      fontFamily: baseStyle.fontFamily?? 'Montserrat',

      // --- Specific Overrides ---
      // If fontSize is provided directly to CustomText, use it; otherwise, keep baseStyle's fontSize.
      fontSize: fontSize ?? baseStyle.fontSize,
      // If fontWeight is provided directly, use it; otherwise, keep baseStyle's fontWeight.
      fontWeight: fontWeight ?? baseStyle.fontWeight,

      // --- Color Logic ---
      // Priority:
      // 1. Specific 'color' parameter (if not null)
      // 2. Required 'textcolor' parameter
      // 3. Color from the 'style' object (implicitly included in baseStyle.color)
      // 4. Color from DefaultTextStyle (implicitly included in baseStyle.color)
      color: color ?? textcolor ?? baseStyle.color,

      // Note: Other properties from 'style' (like letterSpacing, height, decorations)
      // are preserved from baseStyle unless explicitly overridden here.
    );
    // --- End of style determination ---

    // Return Flutter's built-in Text widget
    return Text(
      text, // The text content passed in
      style: effectiveStyle, // Apply the calculated style
      textAlign: textAlign, // Pass through optional alignment
      maxLines: maxLines, // Pass through optional max lines
      overflow: overflow, // Pass through optional overflow behavior
    );
  }
}