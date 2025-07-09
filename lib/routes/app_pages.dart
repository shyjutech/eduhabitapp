import 'package:eduhabit/views/auth/login_view_email.dart';
import 'package:eduhabit/views/auth/signup_view.dart';
import 'package:eduhabit/views/habits/save_habit_viiew.dart';
import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/save_habit_binding.dart';
import '../views/onboarding_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),
    GetPage(name: '/login', page: () => LoginEmail(), binding: AuthBinding()),
    GetPage(
      name: '/signup',
      page: () => SignupView(), // <- your signup screen
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/save_habit',
      page: () => SaveHabitViiew(), // <- your save habit screen
      binding: SaveHabitBinding(),
    ),
  ];
}
