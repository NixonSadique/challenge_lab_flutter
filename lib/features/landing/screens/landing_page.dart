import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:challenge_lab_flutter/features/auth/presentation/screens/register_screen.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_button.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_card_surface.dart';
import 'package:challenge_lab_flutter/shared/widgets/outlined_app_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                colors: [Colors.white.withValues(alpha: 0.1), AppColors.surface],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: AppCardSurface(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.science_rounded,
                        color: AppColors.primary,
                        size: 27,
                      ),
                      Text(
                        "Challenge Lab",
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Solve Real Challenges.",
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    "Build your Future.",
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    "Join a community of forward-thinkers and "
                    "tackle complex problems head-on.",
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    text: "Sign Up",
                  ),
                  const SizedBox(height: 16),
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
