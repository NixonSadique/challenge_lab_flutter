import 'package:challenge_lab_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_button.dart';
import 'package:challenge_lab_flutter/shared/widgets/outlined_app_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/landing_bg.jpg", fit: BoxFit.cover),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withAlpha(10), Colors.white],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.science_rounded,
                        color: Color(0xff005656),
                        size: 27,
                      ),
                      Text(
                        "Challenge Lab",
                        style: TextStyle(
                          color: Color(0xff191C1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Solve Real Challenges.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff191C1D),
                    ),
                  ),
                  Text(
                    "Build your Future.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff005656),
                    ),
                  ),
                  Text(
                    "Join a community of forward-thinkers and "
                    "tackle complex problems head-on.",
                    style: TextStyle(color: Color(0xff3E4948), fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  AppButton(onPressed: () {}, text: "Sign Up"),
                  SizedBox(height: 16),
                  OutlinedAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    text: "Log In",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
