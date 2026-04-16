import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/primary_button.dart';

// TODO: Replace GoogleFonts.inter with Helvetica Neue once the font file is added to assets/fonts/
class _SplashConfig {
  final Color background;
  final double fontSize;
  final Color textColor;
  final double dotSize;
  final Color dotColor;

  const _SplashConfig({
    required this.background,
    required this.fontSize,
    required this.textColor,
    required this.dotSize,
    required this.dotColor,
  });
}

const _configs = [
  _SplashConfig(background: Color(0xFFB778DA), fontSize: 34.29, textColor: Color(0xFFFFFEE9), dotSize: 5.04, dotColor: Color(0xFFECADFF)),
  _SplashConfig(background: Color(0xFF667DEC), fontSize: 34.29, textColor: Color(0xFFFFFEE9), dotSize: 5.04, dotColor: Color(0xFFBC7BCF)),
  _SplashConfig(background: Color(0xFFFCC4F4), fontSize: 34.29, textColor: Color(0xFF700064),  dotSize: 5.04, dotColor: Color(0xFFBC7BCF)),
  _SplashConfig(background: Color(0xFF35347F), fontSize: 27.05, textColor: Color(0xFFFFFEE9), dotSize: 3.98, dotColor: Color(0xFFBC7BCF)),
  _SplashConfig(background: Color(0xFF35347F), fontSize: 42.45, textColor: Color(0xFFFFFEE9), dotSize: 6.24, dotColor: Color(0xFFBC7BCF)),
];

const _slideDuration = Duration(milliseconds: 300);
const _slideHold = Duration(milliseconds: 600);
const _lastSlideHold = Duration(milliseconds: 900);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNext();
  }

  void _scheduleNext() {
    _timer = Timer(_slideHold, _advance);
  }

  void _advance() {
    if (!mounted) return;

    if (_current < _configs.length - 1) {
      setState(() => _current++);
      _scheduleNext();
    } else {
      _timer = Timer(_lastSlideHold, () {
        if (mounted) context.go(AppRoutes.onboarding);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = _configs[_current];

    return Scaffold(
      body: AnimatedContainer(
        duration: _slideDuration,
        curve: Curves.easeOut,
        color: config.background,
        child: SafeArea(
          child: Column(
            children: [
              // Center logo
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: _slideDuration,
                        curve: Curves.easeOut,
                        style: GoogleFonts.inter(
                          fontSize: config.fontSize,
                          fontWeight: FontWeight.w700,
                          color: config.textColor,
                        ),
                        child: const Text('Studentbank'),
                      ),
                      const SizedBox(width: 2),
                      Padding(
                        padding: EdgeInsets.only(bottom: config.fontSize * 0.20),
                        child: AnimatedContainer(
                          duration: _slideDuration,
                          curve: Curves.easeOut,
                          width: config.dotSize,
                          height: config.dotSize,
                          color: config.dotColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PrimaryButton(label: 'Create account'),
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
      ),
    );
  }
}
