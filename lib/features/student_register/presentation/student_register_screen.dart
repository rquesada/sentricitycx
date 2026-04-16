import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';

class StudentRegisterScreen extends StatelessWidget {
  const StudentRegisterScreen({super.key});

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
              Text('Create your\nstudent account', style: AppTextStyles.displayLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Fill in your details to get started.',
                style: AppTextStyles.bodyLarge,
              ),
              const Spacer(),
              // TODO: Add registration form fields here
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.construction_rounded,
                      size: 64,
                      color: AppColors.primary.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Registration form\ncoming soon',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Continue',
                variant: ButtonVariant.filled,
                onPressed: () {
                  // TODO: submit registration
                },
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
