import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EcobankStepsScreen extends StatelessWidget {
  const EcobankStepsScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/just_3_steps_1.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 411,
                  left: 24,
                  child: SizedBox(
                    width: 252,
                    height: 30,
                    child: Text(
                      "Here's what you'll need:",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14,
                        height: 17.5 / 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0A191F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              color: const Color(0xFFF1F1F1),
              child: Padding(
                padding: const EdgeInsets.only(top: 11, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 360,
                      height: 295,
                      padding: const EdgeInsets.only(
                        top: 25,
                        right: 33,
                        bottom: 25,
                        left: 23,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _StepItem(
                            iconAsset: 'assets/images/mobile_icon.png',
                            title: 'Your mobile number',
                            subtitle: "We'll send you a code to confirm it.",
                            textWidth: 232,
                          ),
                          _StepItem(
                            iconAsset: 'assets/images/id_icon.png',
                            title: 'Your ID',
                            subtitle: "We'll use your Ghana Card or International Passport to verify your identity.",
                            textWidth: 221,
                          ),
                          _StepItem(
                            iconAsset: 'assets/images/time_icon.png',
                            title: '5 mins of your time',
                            subtitle: 'Most people finish in under 5 minutes.',
                            textWidth: 197,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    GestureDetector(
                      child: Container(
                        width: 362,
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xFF4D66F4), Color(0xFF4D66F4)],
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x40747AE8),
                              blurRadius: 18.6,
                              spreadRadius: 3,
                              offset: Offset(4, 1),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Let's Go",
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.textWidth,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final double textWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(iconAsset, width: 40, height: 40, fit: BoxFit.contain),
        const SizedBox(width: 12),
        SizedBox(
          width: textWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14.134,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F100E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14.134,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF474747),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
