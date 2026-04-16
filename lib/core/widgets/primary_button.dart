import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;

  static const _bgPrimary = Color(0xFFFFFFFF);
  static const _bgSecondary = Color(0xFF1D1C22);
  static const _textPrimary = Color(0xFF1D1C22);
  static const _textSecondary = Color(0xFFFFFFFF);
  static const _shadow = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 18.6,
    offset: Offset(0, 4),
  );

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == ButtonVariant.primary;
    final bg = isPrimary ? _bgPrimary : _bgSecondary;
    final textColor = isPrimary ? _textPrimary : _textSecondary;

    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [_shadow],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
