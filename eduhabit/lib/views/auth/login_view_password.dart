import 'package:eduhabit/controllers/auth_controller.dart';
import 'package:eduhabit/themes/theme.dart';
import 'package:eduhabit/widgets/loginpageWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginPassword extends StatefulWidget {
  final AuthController authController = Get.put(AuthController());

  LoginPassword({super.key});

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  final TextEditingController passController = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
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
                  controller: passController,
                  isPassword: true,
                  validator: (String? value) {
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              CustomContinueButton(onPressed: () {}),
              SizedBox(height: 20),
              devider(),
              SizedBox(height: 20),
              GoogleSignupButton(onPressed: () {}),
              SizedBox(height: 30),
              TermsAndPrivacy(),
              SizedBox(height: 30),
              SignupPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}
