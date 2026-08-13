import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_button.dart';

class RegistrationActionArea extends StatelessWidget {
  final VoidCallback onRegister;
  final bool isLoading;

  const RegistrationActionArea({
    super.key,
    required this.onRegister,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        AppButton(
          onPressed: onRegister,
          text: 'Create Account',
          isLoading: isLoading,
        ),
        const Text(
          "By creating an account, you agree to our"
          " Terms of Service and Privacy Policy.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
