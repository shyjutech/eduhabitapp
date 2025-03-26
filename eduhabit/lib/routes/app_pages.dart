import 'package:eduhabit/views/auth/login_view_email.dart';
import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../views/login_view.dart';
import '../views/onboarding_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),
    GetPage(name: '/login', page: () => LoginEmail(), binding: AuthBinding()),
  ];
}
