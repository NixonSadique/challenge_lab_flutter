import 'package:flutter/material.dart';

class IconAuthField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool isTextObscured;
  final Icon prefixIcon;
  final IconButton? suffixIcon;

  const IconAuthField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isTextObscured,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      textAlign: TextAlign.center,
      obscureText: isTextObscured,
    );
  }
}
