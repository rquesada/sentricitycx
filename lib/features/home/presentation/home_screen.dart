import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
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

    // Start bounce after a brief delay
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
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Animated logo
              ScaleTransition(
                scale: _bounceAnim,
                child: _LogoWidget(),
              ),

              const Spacer(flex: 3),

              // Buttons
              PrimaryButton(
                label: 'Create Account',
                variant: ButtonVariant.filled,
                onPressed: () => context.push(AppRoutes.accountType),
              ),
              const SizedBox(height: AppSpacing.sm),
              PrimaryButton(
                label: 'Log In',
                variant: ButtonVariant.outlined,
                // No action
              ),

              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TODO: Replace with actual logo asset
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 32,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: const Icon(
            Icons.school_rounded,
            size: 64,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('SentricityCX', style: AppTextStyles.displayMedium),
        const SizedBox(height: AppSpacing.xs),
        Text('Your learning companion', style: AppTextStyles.bodyMedium),
      ],
    );
  }
}
