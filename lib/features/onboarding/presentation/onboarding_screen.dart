import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/primary_button.dart';
import 'widgets/onboarding_page_one.dart';
import 'widgets/onboarding_page_two.dart';
import 'widgets/onboarding_page_three.dart';
import 'widgets/page_indicator.dart';

// Each entry is [pageIndex, stateIndex] — total steps across all pages
const _steps = [
  [0, 0], // Page 1, state 1
  [0, 1], // Page 1, state 2
  [1, 0], // Page 2, state 1
  [1, 1], // Page 2, state 2
  [2, 0], // Page 3, state 1
  [2, 1], // Page 3, state 2
  [2, 2], // Page 3, state 3
];

const _stepDuration = Duration(seconds: 3);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _stepIndex = 0;
  Timer? _timer;

  int get _currentPage => _steps[_stepIndex][0];
  int get _currentState => _steps[_stepIndex][1];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_stepDuration, (_) => _advance());
  }

  void _advance() {
    if (!mounted) return;

    if (_stepIndex < _steps.length - 1) {
      final nextStep = _stepIndex + 1;
      final currentPage = _currentPage;
      final nextPage = _steps[nextStep][0];

      setState(() => _stepIndex = nextStep);

      // Animate PageView only when the page actually changes
      if (nextPage != currentPage) {
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    } else {
      _timer?.cancel();
      context.go(AppRoutes.home);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Pages — physics disabled; we control navigation ourselves
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OnboardingPageOne(state: _currentPage == 0 ? _currentState : 0),
              OnboardingPageTwo(state: _currentPage == 1 ? _currentState : 0),
              OnboardingPageThree(state: _currentPage == 2 ? _currentState : 0),
            ],
          ),

          // Top: page indicator
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.lg),
                child: PageIndicator(count: 3, current: _currentPage),
              ),
            ),
          ),

          // Bottom: action buttons
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            bottom: AppSpacing.xxl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  label: 'Create Account',
                  variant: ButtonVariant.filled,
                  // Visible but no action during onboarding
                ),
                const SizedBox(height: AppSpacing.sm),
                PrimaryButton(
                  label: 'Log In',
                  variant: ButtonVariant.outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
