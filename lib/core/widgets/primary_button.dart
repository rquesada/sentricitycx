import 'dart:ui';
import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, ghost }

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
  static const _textWhite = Color(0xFFFFFFFF);
  static const _shadow = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 18.6,
    offset: Offset(0, 4),
  );

  @override
  Widget build(BuildContext context) {
    if (variant == ButtonVariant.ghost) {
      return _GlassButton(label: label, onPressed: onPressed);
    }

    final bg = variant == ButtonVariant.primary ? _bgPrimary : _bgSecondary;
    final textColor = variant == ButtonVariant.primary ? _textPrimary : _textWhite;

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
          child: _ButtonLabel(label: label, textColor: textColor),
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  const _GlassButton({required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0x1AFFFFFF),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0x40FFFFFF),
              width: 1,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onPressed,
              child: _ButtonLabel(label: label, textColor: const Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonLabel extends StatelessWidget {
  const _ButtonLabel({required this.label, required this.textColor});

  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
