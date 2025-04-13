import 'package:eduhabit/controllers/auth_controller.dart';
import 'package:eduhabit/routes/app_pages.dart';
import 'package:eduhabit/routes/app_routes.dart' show Routes;

import 'package:eduhabit/themes/theme.dart';
import 'package:eduhabit/views/auth/login_view_email.dart';
import 'package:eduhabit/widgets/continue_button.dart';
import 'package:eduhabit/widgets/custom_textfield.dart';
import 'package:eduhabit/widgets/google_signup_button.dart';
import 'package:eduhabit/widgets/signup_or_signin_prompt.dart';
import 'package:eduhabit/widgets/terms_privacy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class LoginPassword extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());

  LoginPassword({super.key});

  final _formKeyPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
                          ? AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )
                          : AppThemes.darkTheme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 20),
              Form(
                child: CustomTextField(
                  title: "Password",
                  hintText: "Password",
                  controller: _controller.passwordController,
                  isPassword: true,
                  validator: (String? value) {
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              CustomContinueButton(
                onPressed: () {
                  _controller.login();
                },
              ),
              SizedBox(height: 20),
              devider(),
              SizedBox(height: 20),
              GoogleSignupButton(onPressed: () {}),
              SizedBox(height: 30),
              TermsAndPrivacy(),
              SizedBox(height: 30),

Material(
  color: Colors.transparent,
  child: InkWell(
    onTap: () {
      print("navigation called");
      Get.toNamed(Routes.SIGNUP);
    },
    child: SignupSigninPrompt(
      text1: "Don't have an account? ",
      text2: "Sign Up",
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
