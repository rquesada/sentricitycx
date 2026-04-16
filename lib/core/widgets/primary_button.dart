import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_spacing.dart';

enum ButtonVariant { filled, outlined }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.filled,
    this.width = double.infinity,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isFilled = variant == ButtonVariant.filled;

    return SizedBox(
      width: width,
      height: 52,
      child: isFilled
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.buttonPrimary.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                ),
                elevation: 0,
              ),
              child: Text(label, style: AppTextStyles.labelLarge),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.buttonBorder, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                ),
              ),
              child: Text(label, style: AppTextStyles.labelLarge),
            ),
    );
  }
}
