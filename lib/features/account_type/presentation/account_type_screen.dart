import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/app_router.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background image pinned to top
            Image.asset(
              'assets/images/get_started_1.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            const SizedBox(height: 47),

            // "Get started." text
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                width: 345,
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 25.6,
                      height: 35.84 / 25.6,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F100E),
                    ),
                    children: const [
                      TextSpan(text: 'Get started'),
                      TextSpan(
                        text: '.',
                        style: TextStyle(color: Color(0xFFBC7BCF)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            // Subtitle text
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                width: 345,
                child: const Text(
                  'Open your StudentBank account in minutes.',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 14,
                    height: 17.5 / 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 47),

            // Student account button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _AccountButton(
                label: 'Open my student account',
                iconAsset: 'assets/images/student_account_icon.png',
                backgroundColor: const Color(0x1A747AE8),
                borderColor: const Color(0xFF747AE8),
                shadowColor: const Color(0x267473B3),
                rightPadding: 80,
                onTap: () => context.push(AppRoutes.studentRegister),
              ),
            ),

            const SizedBox(height: 25),

            // Child account button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _AccountButton(
                label: "Set up my child's account",
                iconAsset: 'assets/images/child_account_icon.png',
                backgroundColor: const Color(0xFFF5F6F7),
                borderColor: const Color(0x45B5B4B4),
                shadowColor: const Color(0x14000000),
                rightPadding: 77.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountButton extends StatelessWidget {
  const _AccountButton({
    required this.label,
    required this.iconAsset,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.rightPadding,
    this.onTap,
  });

  final String label;
  final String iconAsset;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double rightPadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 345,
        height: 70,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 6.3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 15, top: 4, right: rightPadding, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon — liquid glass circular frame
            ClipRRect(
              borderRadius: BorderRadius.circular(79.49),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: 62,
                  height: 61,
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(79.49),
                    border: Border.all(color: const Color(0x40FFFFFF), width: 1),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 16.8,
                      height: 21.6,
                      child: Image.asset(iconAsset, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14,
                  height: 17.5 / 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F0E0E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
