import 'package:eduhabit/routes/app_pages.dart';
import 'package:eduhabit/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/auth_binding.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized(); // Ensures async functions work in main()
  // await Firebase.initializeApp(); // Initialize Firebase before running the app

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduHabit',
      initialRoute: '/login',
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // Auto-switch based on system settings
      initialBinding: AuthBinding(),
    );
  }
}
