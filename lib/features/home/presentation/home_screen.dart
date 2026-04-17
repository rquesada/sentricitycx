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

          // Buttons at the bottom
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
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
                        variant: ButtonVariant.secondary,
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
