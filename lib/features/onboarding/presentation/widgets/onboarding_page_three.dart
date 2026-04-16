import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Page 3: 3 states
/// Same background image, only the text color changes between states
class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key, required this.state});

  final int state;

  static const _textColors = [
    AppColors.onboardingTextState1,
    AppColors.onboardingTextState2,
    AppColors.onboardingTextState3,
  ];

  static const _texts = [
    'Connect with\nyour community',
    'Connect with\nyour community',
    'Connect with\nyour community',
  ];

  static const _subtitles = [
    'Study together, grow together.',
    'Study together, grow together.',
    'Study together, grow together.',
  ];

  @override
  Widget build(BuildContext context) {
    final textColor = _textColors[state.clamp(0, 2)];

    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Same background for all states
          // TODO: Replace with actual image asset
          Container(
            color: const Color(0xFF1A3A2A),
            child: const Center(
              child: Icon(Icons.people_rounded, size: 120, color: AppColors.indicatorInactive),
            ),
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
          // Animated text color
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: 160,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: AppTextStyles.displayLarge.copyWith(color: textColor),
              child: Text(_texts[state.clamp(0, 2)]),
            ),
          ),
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: 110,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: AppTextStyles.bodyLarge.copyWith(color: textColor.withValues(alpha: 0.8)),
              child: Text(_subtitles[state.clamp(0, 2)]),
            ),
          ),
        ],
      ),
    );
  }
}
