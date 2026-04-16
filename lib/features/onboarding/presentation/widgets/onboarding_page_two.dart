import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_text_styles.dart';

/// Page 2: 2 states — similar to page 1 but different images and text
class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key, required this.state});

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
          Container(
            color: const Color(0xFF2A1A3A),
            child: const Center(
              child: Icon(Icons.auto_stories_rounded, size: 120, color: AppColors.indicatorInactive),
            ),
          ),
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
          Container(
            color: const Color(0xFF3A1A2A),
            child: const Center(
              child: Icon(Icons.emoji_events_rounded, size: 120, color: AppColors.indicatorInactive),
            ),
          ),
          const _BottomGradient(),
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Track your\nprogress', style: AppTextStyles.displayLarge),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Real-time insights to keep you\nmotivated and on track.',
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
