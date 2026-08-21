import 'dart:io';

import 'package:challenge_lab_flutter/features/auth/data/auth_service.dart';
import 'package:challenge_lab_flutter/features/auth/data/models/auth_models.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/account_type_selector.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/profile_image_picker.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/registration_action_area.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/registration_form.dart';
import 'package:challenge_lab_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  List accountType = ['INDIVIDUAL', 'PROFESSIONAL', 'COMPANY'];
  int selectedIndex = 0;
  bool _isPasswordObscured = true;

  bool _isLoading = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final authService = AuthService();

  void handleRegister() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final request = RegisterRequest(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        bio: _bioController.text,
      );

      final response = await authService.register(
        request,
        accountType[selectedIndex],
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Hello ${response.username},"
            " your user id is ${response.userId}",
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e is Exception
                ? e.toString().replaceFirst("Exception: ", "")
                : "An unexpected error occurred.",
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _firstNameController.text = "";
          _lastNameController.text = "";
          _emailController.text = "";
          _usernameController.text = "";
          _passwordController.text = "";
          _bioController.text = "";
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
    if (pickedFile == null) return;

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: Color(0xff005656),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.end,
        ),
        backgroundColor: const Color(0xffF8F9FA),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileImagePicker(image: _image, onPickImage: _pickImage),
          const SizedBox(height: 16),
          RegistrationForm(
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            usernameController: _usernameController,
            emailController: _emailController,
            passwordController: _passwordController,
            bioController: _bioController,
            isPasswordObscured: _isPasswordObscured,
            onTogglePasswordVisibility: () => setState(() {
              _isPasswordObscured = !_isPasswordObscured;
            }),
          ),
          const SizedBox(height: 40),
          AccountTypeSelector(
            accountTypes: accountType,
            selectedIndex: selectedIndex,
            onTypeSelected: (index) => setState(() {
              selectedIndex = index;
            }),
          ),
          const SizedBox(height: 40),
          RegistrationActionArea(
            onRegister: handleRegister,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
