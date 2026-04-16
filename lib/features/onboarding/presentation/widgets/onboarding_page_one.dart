import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key, required this.state});

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
          Image.asset(
            'assets/images/intro_screen_1_1.png',
            fit: BoxFit.cover,
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
          Image.asset(
            'assets/images/intro_screen_1_2.png',
            fit: BoxFit.cover,
          ),
          const _BottomGradient(),
          Positioned(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: 136,
            child: SizedBox(
              width: 352,
              child: Text(
                'FINANCE \nYOUR FUTURE',
                // TODO: Replace GoogleFonts.inter with Avenir Next once font file is added
                style: GoogleFonts.inter(
                  fontSize: 41.25,
                  height: 36.71 / 41.25,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
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
