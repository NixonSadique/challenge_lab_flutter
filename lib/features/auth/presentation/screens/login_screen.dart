import 'package:challenge_lab_flutter/features/auth/data/auth_service.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_button.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  final authService = AuthService();
  bool _isLoading = false;

  void handleLogin() async {
    final identifier = _identifierController.text;
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });
    try {
      await authService.login(identifier, password);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login successful!')));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Challenge Lab",
          style: TextStyle(
            color: Color(0xff005656),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xffF8F9FA),
      ),

      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff191C1D),
                ),
              ),
              Text(
                "Welcome back to ChallengeLab!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xff3e4948),
                ),
              ),

              SizedBox(height: 40),

              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE1E3E4)),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),

                child: Column(
                  children: [
                    AuthField(
                      controller: _identifierController,
                      hint: "Enter your Username or Email",
                      isTextObscured: false,
                    ),

                    SizedBox(height: 16),

                    AuthField(
                      controller: _passwordController,
                      hint: "Enter your Password",
                      isTextObscured: true,
                    ),

                    SizedBox(height: 10),
                    AppButton(
                      isLoading: _isLoading,
                      onPressed: handleLogin,
                      text: "Log In",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff005656),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
