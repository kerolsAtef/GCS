
import 'package:flutter/material.dart';

class TextFieldCustomization extends StatelessWidget {
  TextFieldCustomization({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.isObscure
  });

  String hint;
  Icon icon;
  bool isObscure;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
