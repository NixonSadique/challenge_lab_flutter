import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool isTextObscured;

  const AuthField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isTextObscured,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
      ),
      textAlign: TextAlign.center,
      obscureText: isTextObscured,
    );
  }
}
