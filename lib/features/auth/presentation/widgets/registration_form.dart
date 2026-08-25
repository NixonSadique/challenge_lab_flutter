import 'package:flutter/material.dart';
import 'auth_field.dart';
import 'icon_auth_field.dart';

class RegistrationForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController bioController;
  final bool isPasswordObscured;
  final VoidCallback onTogglePasswordVisibility;

  const RegistrationForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.bioController,
    required this.isPasswordObscured,
    required this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("First Name", style: textTheme.labelLarge),
        AuthField(
          controller: firstNameController,
          hint: "Enter your First Name",
          isTextObscured: false,
        ),
        const SizedBox(height: 8),
        Text("Last Name", style: textTheme.labelLarge),
        AuthField(
          controller: lastNameController,
          hint: "Enter your Last Name",
          isTextObscured: false,
        ),
        const SizedBox(height: 8),
        Text("Username", style: textTheme.labelLarge),
        IconAuthField(
          controller: usernameController,
          hint: "Enter a username",
          isTextObscured: false,
          prefixIcon: const Icon(Icons.alternate_email),
        ),
        const SizedBox(height: 8),
        Text("Email", style: textTheme.labelLarge),
        IconAuthField(
          controller: emailController,
          hint: "Enter your Email",
          prefixIcon: const Icon(Icons.email_outlined),
          isTextObscured: false,
        ),
        const SizedBox(height: 8),
        Text("Password", style: textTheme.labelLarge),
        IconAuthField(
          controller: passwordController,
          hint: "Enter a password",
          prefixIcon: const Icon(Icons.lock_outlined),
          suffixIcon: IconButton(
            onPressed: onTogglePasswordVisibility,
            icon: isPasswordObscured
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_outlined),
          ),
          isTextObscured: isPasswordObscured,
        ),
        const SizedBox(height: 8),
        Text("Bio", style: textTheme.labelLarge),
        AuthField(
          controller: bioController,
          hint: "Tell us a bit about yourself",
          isTextObscured: false,
        ),
      ],
    );
  }
}
