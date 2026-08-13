import 'package:flutter/material.dart';

class IconAuthField extends StatelessWidget {
  final TextEditingController? _controller;
  final String _hint;
  final bool isTextObscured;
  final Icon prefixIcon;
  final IconButton? suffixIcon;

  const IconAuthField({
    super.key,
    required this._controller,
    required this._hint,
    required this.isTextObscured,
    required this.prefixIcon,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: _hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
      textAlign: TextAlign.center,
      obscureText: isTextObscured,
    );
  }
}
