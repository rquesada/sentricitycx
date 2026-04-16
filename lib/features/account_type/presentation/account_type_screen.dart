import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              Text('Who are you?', style: AppTextStyles.displayLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Select the type of account\nyou want to create.',
                style: AppTextStyles.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xxl),
              _AccountTypeCard(
                icon: Icons.child_care_rounded,
                title: 'Child',
                subtitle: 'For younger learners',
                onTap: null, // Not active
              ),
              const SizedBox(height: AppSpacing.md),
              _AccountTypeCard(
                icon: Icons.person_rounded,
                title: 'Student',
                subtitle: 'For independent learners',
                onTap: () => context.push(AppRoutes.studentRegister),
                isActive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountTypeCard extends StatelessWidget {
  const _AccountTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isActive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final opacity = isActive ? 1.0 : 0.4;

    return Opacity(
      opacity: opacity,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.1)
                : AppColors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppSpacing.md),
            border: Border.all(
              color: isActive ? AppColors.primary : AppColors.white.withValues(alpha: 0.1),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primary.withValues(alpha: 0.2)
                      : AppColors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
                child: Icon(icon, color: isActive ? AppColors.primary : AppColors.white, size: 28),
              ),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.labelLarge),
                  Text(subtitle, style: AppTextStyles.bodyMedium),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: isActive ? AppColors.primary : AppColors.white.withValues(alpha: 0.3),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
