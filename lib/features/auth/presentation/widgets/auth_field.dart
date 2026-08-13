import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController? _controller;
  final String _hint;
  final bool isTextObscured;

  const AuthField({super.key, required this._controller, required this._hint, required this.isTextObscured});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: _hint,
      ),
      textAlign: TextAlign.center,
      obscureText: isTextObscured,
    );
  }

}