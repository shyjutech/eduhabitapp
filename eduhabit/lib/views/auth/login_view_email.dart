import 'package:eduhabit/controllers/auth_controller.dart';
import 'package:eduhabit/themes/theme.dart';
import 'package:eduhabit/views/auth/login_view_password.dart';
import 'package:eduhabit/widgets/continue_button.dart';
import 'package:eduhabit/widgets/custom_textfield.dart';
import 'package:eduhabit/widgets/google_signup_button.dart';
import 'package:eduhabit/widgets/signup_or_signin_prompt.dart';
import 'package:eduhabit/widgets/terms_privacy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginEmail extends StatefulWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();

  LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final TextEditingController emailController = TextEditingController();
  final formKeyEmail = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Form(
            key: formKeyEmail,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48),
                SvgPicture.asset("assets/logo.svg"),
                //Image.asset("assets/eduhabit.png", cacheHeight: 200),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Welcome to EduHabit",

                    style:
                        Theme.of(context).brightness == Brightness.light
                            ? AppThemes.lightTheme.textTheme.headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                )
                            : AppThemes.darkTheme.textTheme.headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Keep achieving and celebrating your wins.",
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).brightness == Brightness.light
                            ? AppThemes.lightTheme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)
                            : AppThemes.darkTheme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  title: "Email",
                  hintText: "Email or Username",
                  controller: emailController,
                  isPassword: false,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomContinueButton(
                  onPressed: () {
                    if (formKeyEmail.currentState!.validate()) {
                      Get.to(LoginPassword());
                    }
                  },
                ),
                SizedBox(height: 20),
                devider(),
                SizedBox(height: 20),
                GoogleSignupButton(onPressed: () {}),
                SizedBox(height: 30),
                TermsAndPrivacy(),
                SizedBox(height: 30),
                SignupSigninPrompt(
                  text1: "Don't have an account? ",
                  text2: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget devider() {
  return Row(
    children: [
      Expanded(child: Divider(color: Color(0xffD5D7DA), thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text("OR", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(child: Divider(color: Color(0xffD5D7DA), thickness: 1)),
    ],
  );
}
