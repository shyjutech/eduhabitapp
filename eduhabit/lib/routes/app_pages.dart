import 'package:eduhabit/views/auth/login_view_email.dart';
import 'package:get/get.dart';

import '../bindings/auth_binding.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/login', page: () => LoginEmail(), binding: AuthBinding()),
  ];
}
