import 'package:eduhabit/views/onboarding_view.dart';
import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../views/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
  ];
}
