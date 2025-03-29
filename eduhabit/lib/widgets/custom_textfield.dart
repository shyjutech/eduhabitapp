import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
