import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final FormFieldValidator<String> validator;

  const CustomTextFormField({
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 10),
        SizedBox(
          width: 380,
          height: 56, // 🔥 Increased height to make space for error text
          child: TextFormField(
            obscureText: isPassword,
            controller: controller,
            validator: validator, // 👈 Make sure to pass the validator here
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey, // 👈 This controls hint text color
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ), // 👈 style for error message
            ),
          ),
        ),
      ],
    );
  }
}
