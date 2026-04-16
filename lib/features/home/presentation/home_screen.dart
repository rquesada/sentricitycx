import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnim;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _bounceAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.elasticOut,
      ),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _bounceController.forward();
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF35347F),
      body: SafeArea(
        child: Column(
          children: [
            // Centered logo with bounce
            Expanded(
              child: Center(
                child: ScaleTransition(
                  scale: _bounceAnim,
                  child: const _StudentbankLogo(),
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    label: 'Create account',
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
    );
  }
}

class _StudentbankLogo extends StatelessWidget {
  const _StudentbankLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // TODO: Replace GoogleFonts.inter with Helvetica Neue once font file is added
        Text(
          'Studentbank',
          style: GoogleFonts.inter(
            fontSize: 42.45,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFFEE9),
          ),
        ),
        const SizedBox(width: 2),
        Padding(
          padding: EdgeInsets.only(bottom: 42.45 * 0.20),
          child: Container(
            width: 6.24,
            height: 6.24,
            color: const Color(0xFFBC7BCF),
          ),
        ),
      ],
    );
  }
}
