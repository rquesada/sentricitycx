import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF35347F),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image starting 61dp from top
          Positioned(
            top: 61,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/welcome_screen_1.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Logo — slightly below center
                Expanded(
                  child: Align(
                    alignment: const Alignment(0, 0.3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontSize: 42,
                              height: 1.0,
                              letterSpacing: 42 * -0.02,
                              color: Color(0xFFFFFEE9),
                            ),
                            children: const [
                              TextSpan(
                                text: 'Student',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: 'bank',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 2),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 42 * 0.20),
                          child: Container(
                            width: 6.24,
                            height: 6.24,
                            color: const Color(0xFFBC7BCF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Buttons at the bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PrimaryButton(
                        label: 'Create account',
                        variant: ButtonVariant.ghost,
                        onPressed: () => context.push(AppRoutes.accountType),
                      ),
                      const SizedBox(height: 16),
                      const PrimaryButton(
                        label: 'Login',
                        variant: ButtonVariant.secondaryWhite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
