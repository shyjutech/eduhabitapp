import 'package:eduhabit/routes/app_routes.dart';
import 'package:eduhabit/themes/theme.dart';
import 'package:eduhabit/utils/strings.dart';
import 'package:eduhabit/widgets/custom_text.dart';
import 'package:eduhabit/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';   import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart'; // 👈 Important! Add this import at top


class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full Name cannot be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String fullName = _fullNameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      print('Form is valid. Signing up: $fullName, $email');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of width
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03), // 3% of height
                  Row(
                    children: [
                      Icon(Icons.arrow_back, size: screenWidth * 0.06), // icon size responsive
                      SizedBox(width: screenWidth * 0.02),
                      CustomText(
                        "Sign Up",
                        fontSize: screenWidth * 0.06, // text size responsive
                        textcolor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Divider(thickness: 1, color: Colors.grey),
                  CustomText(
                    CustomStrings.signupHeading,
                    textcolor: Colors.black,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    title: 'Full Name',
                    hintText: 'John Doe',
                    controller: _fullNameController,
                    isPassword: false,
                    validator: _validateFullName,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    title: 'Email',
                    hintText: 'John@gmail.com',
                    controller: _emailController,
                    isPassword: false,
                    validator: _validateEmail,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    controller: _passwordController,
                    isPassword: true,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    title: 'Confirm Password',
                    hintText: 'Confirm password',
                    controller: _confirmPasswordController,
                    isPassword: true,
                    validator: _validateConfirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemes.primaryDefault,
                      fixedSize: Size(screenWidth, screenHeight * 0.07), // full width button
                    ),
                    child: CustomText(
                      "Sign Up",
                      textcolor: Colors.white,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                        ),
                        children: [
                          TextSpan(text: "By continuing, you agree to our "),
                          TextSpan(
                            text: "Terms of Service.",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          TextSpan(text: " View our "),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
             
// Inside your SignupView build method:
Center(
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      children: [
        TextSpan(text: "Already have an account? "), // 👈 corrected text
        TextSpan(
          text: "Sign in",
          style: TextStyle(
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed(Routes.LOGIN); // 👈 navigate to login
            },
        ),
        TextSpan(text: " here."),
      ],
    ),
  ),
),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
