import 'package:eduhabit/themes/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//Textfield
class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          width: 380,
          height: 56,
          child: TextFormField(
            obscureText: isPassword ? true : false,

            controller: controller,
            decoration: InputDecoration(
              suffixIcon:
                  controller.text.isEmpty
                      ? IconButton(
                        onPressed: () {
                          controller.clear();
                        },
                        icon: Image.asset("assets/remove.png", cacheHeight: 15),
                      )
                      : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),

              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}

//ElevatedButton(Continue)
class CustomContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style:
            Theme.of(context).brightness == Brightness.light
                ? ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.lightTheme.primaryColor,
                )
                : ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.darkTheme.primaryColor,
                ),
        child: Text(
          "Continue",
          style:
              Theme.of(context).brightness == Brightness.light
                  ? AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                  : AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
        ),
      ),
    );
  }
}

//ElevetedButton(SignUp)
class GoogleSignupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          side: WidgetStateProperty.all(
            BorderSide(color: Color(0xffA6A8AA), width: 1),
          ),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/search.png", cacheHeight: 15),
            Text(
              "Continue with Google",
              style:
                  Theme.of(context).brightness == Brightness.light
                      ? AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff121212),
                      )
                      : AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

//Terms&Privacy
class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By continuing, you agree to our ',
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' View and ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: 'Privacy Policy.',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}

//Signup Prompt
class SignupPrompt extends StatelessWidget {
  const SignupPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Don't have an account? ",
          style: Theme.of(context).textTheme.labelMedium,
          children: [
            TextSpan(
              text: 'Sign up ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.blue
                        : Colors.lightBlueAccent,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: 'here.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

//Divider
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
