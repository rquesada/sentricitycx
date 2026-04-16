import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key, required this.state});

  final int state;

  // State 1: no text, State 2: low opacity, State 3: full opacity
  static const _textColors = [
    Colors.transparent,
    Color(0x4DFFD4F9),
    Color(0xFFFFD4F9),
  ];

  @override
  Widget build(BuildContext context) {
    final textColor = _textColors[state.clamp(0, 2)];

    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/intro_screen_3_1.png',
            fit: BoxFit.cover,
          ),
          // Bottom gradient
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.background],
                ),
              ),
            ),
          ),
          // Animated text (hidden in state 1 via transparent color)
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: 136,
            child: SizedBox(
              width: 322,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                // TODO: Replace GoogleFonts.inter with Avenir Next once font file is added
                style: GoogleFonts.inter(
                  fontSize: 41.25,
                  height: 36.71 / 41.25,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
                child: const Text('STAY ON TOP\nOF YOUR\nSPENDING'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
