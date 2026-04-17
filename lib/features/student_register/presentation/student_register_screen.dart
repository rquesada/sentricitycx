import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/app_router.dart';

class StudentRegisterScreen extends StatelessWidget {
  const StudentRegisterScreen({super.key});

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
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/images/get_started_2_1.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            // Credit card overlay
            Positioned(
              top: 161,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 350,
                  height: 212,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 81.3,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/credit_card.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Content column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 481),

                // "Do you already bank with Ecobank?"
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: SizedBox(
                    width: 287,
                    height: 72,
                    child: Text(
                      'Do you already bank with Ecobank?',
                      style: const TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 25.6,
                        height: 35.84 / 25.6,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F100E),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 85),

                // Yes button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _BankButton(
                    label: 'Yes, I already bank with Ecobank',
                    iconAsset: 'assets/images/ecobank_logo.png',
                    backgroundColor: const Color(0x1A747AE8),
                    borderColor: const Color(0xFF747AE8),
                    shadowColor: const Color(0x267473B3),
                    iconWidth: 51,
                    iconHeight: 25,
                  ),
                ),

                const SizedBox(height: 25),

                // No button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _BankButton(
                    label: 'No, I am with another bank',
                    iconAsset: 'assets/images/logo_access.png',
                    backgroundColor: const Color(0xFFF5F6F7),
                    borderColor: const Color(0x45B5B4B4),
                    shadowColor: const Color(0x14000000),
                    iconWidth: 46,
                    iconHeight: 45,
                    onTap: () => context.push(AppRoutes.ecobankSteps),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BankButton extends StatelessWidget {
  const _BankButton({
    required this.label,
    required this.iconAsset,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.iconWidth,
    required this.iconHeight,
    this.onTap,
  });

  final String label;
  final String iconAsset;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
        padding: const EdgeInsets.only(left: 15, top: 4, right: 15, bottom: 5),
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
                      width: iconWidth,
                      height: iconHeight,
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
                maxLines: 2,
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
