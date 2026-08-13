import 'dart:io';

import 'package:challenge_lab_flutter/features/auth/data/auth_service.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/account_type_card.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/auth_field.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/icon_auth_field.dart';

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
  final _lastNamerController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final authService = AuthService();

  void handleRegister() async {
    final firstname = _firstNameController.text;
    final lastName = _lastNamerController.text;
    final email = _emailController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final bio = _bioController.text;

    Map<String, dynamic> request = {
      'firstname': firstname,
      'lastName': lastName,
      'email': email,
      'username': username,
      'password': password,
      'bio': bio,
    };
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await authService.register(
        request,
        accountType[selectedIndex],
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Hello ${response['username']},"
            " your user id is ${response['userId']}",
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e is Exception
                ? e.toString().replaceFirst("Error: ", "")
                : "An unexpected error occurred.",
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
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
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Color(0xff005656),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.end,
        ),
        backgroundColor: Color(0xffF8F9FA),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    alignment: Alignment.center,
                    height: 98,
                    width: 98,
                    decoration: BoxDecoration(
                      color: Color(0xffe1e3e4),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffbdc9c8), width: 2),
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: Color(0xff6E7979),
                      size: 33,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text("Upload Profile Photo"),
            ],
          ),
          Text("First Name"),
          AuthField(
            controller: null,
            hint: "Enter your First Name",
            isTextObscured: false,
          ),
          Text("Last Name"),
          AuthField(
            controller: null,
            hint: "Enter your Last Name",
            isTextObscured: false,
          ),
          Text("Username"),
          IconAuthField(
            controller: null,
            hint: "Enter a username",
            isTextObscured: false,
            prefixIcon: Icon(Icons.alternate_email),
          ),
          Text("Email"),
          IconAuthField(
            controller: null,
            hint: "Enter your Email",
            prefixIcon: Icon(Icons.email_outlined),
            isTextObscured: false,
          ),
          Text("Password"),
          IconAuthField(
            controller: null,
            hint: "Enter a password",
            prefixIcon: Icon(Icons.lock_outlined),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                _isPasswordObscured = !_isPasswordObscured;
              }),
              icon: _isPasswordObscured
                  ? Icon(Icons.visibility_off_outlined)
                  : Icon(Icons.visibility_outlined),
            ),
            isTextObscured: _isPasswordObscured,
          ),
          Text("Bio"),
          AuthField(
            controller: null,
            hint: "Tell us a bit about yourself",
            isTextObscured: false,
          ),
          SizedBox(height: 40),

          Text('Account Type'),
          AccountTypeCard(
            icon: Icons.person_outline_rounded,
            title: accountType[0],
            description: 'Solve Challenges and Build your portfolio.',
            selected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          AccountTypeCard(
            icon: Icons.person_outline_rounded,
            title: accountType[1],
            description:
                'Share expertise and solve challenges to improve your skills!',
            selected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          AccountTypeCard(
            icon: Icons.person_outline_rounded,
            title: accountType[2],
            description: 'Post Challenges.',
            selected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),

          SizedBox(height: 40),

          Column(
            spacing: 8,
            children: [
              AppButton(
                onPressed: handleRegister,
                text: 'Create Account',
                isLoading: _isLoading,
              ),
              Text(
                "By creating an account, you agree to our"
                    " Terms of Service and Privacy Policy.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
