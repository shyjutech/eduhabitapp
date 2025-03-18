import 'package:flutter/material.dart';

class AppConstants {
  // 🔹 General App Info
  static const String appName = "EduHabit";
  static const String appVersion = "1.0.0";
  static const String privacyPolicyUrl = "https://yourdomain.com/privacy-policy";

  // 🔹 Default Habit Categories
  static const List<String> habitCategories = [
    "Study",
    "Reading",
    "Exercise",
    "Meditation",
    "Time Management",
  ];

  // 🔹 Color Palette (For Custom Themes)
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.blueGrey;
  static const Color backgroundColor = Colors.white;
}
