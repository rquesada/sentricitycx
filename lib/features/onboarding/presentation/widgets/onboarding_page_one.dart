import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Page 1: 2 states
/// State 1 → only image
/// State 2 → different image + text
class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key, required this.state});

  /// 0-indexed state (0 or 1)
  final int state;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: state == 0 ? _StateOne(key: const ValueKey(0)) : _StateTwo(key: const ValueKey(1)),
    );
  }
}

class _StateOne extends StatelessWidget {
  const _StateOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // TODO: Replace with actual image asset
          Container(
            color: const Color(0xFF1A1A3A),
            child: const Center(
              child: Icon(Icons.image_rounded, size: 120, color: AppColors.indicatorInactive),
            ),
          ),
          // Gradient overlay from bottom for buttons area
          const _BottomGradient(),
        ],
      ),
    );
  }
}

class _StateTwo extends StatelessWidget {
  const _StateTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // TODO: Replace with actual image asset
          Container(
            color: const Color(0xFF1A2A3A),
            child: const Center(
              child: Icon(Icons.image_search_rounded, size: 120, color: AppColors.indicatorInactive),
            ),
          ),
          const _BottomGradient(),
          // Text content
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Learn smarter,\nnot harder', style: AppTextStyles.displayLarge),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Personalized learning paths designed\nfor every student.',
                  style: AppTextStyles.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomGradient extends StatelessWidget {
  const _BottomGradient();

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
