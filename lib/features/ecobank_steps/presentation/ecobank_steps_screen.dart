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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/just_3_steps_1.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 322,
                  left: 24,
                  child: SizedBox(
                    width: 316,
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF7271AD), Color(0xFF464498)],
                      ).createShader(bounds),
                      child: const Text(
                        'JUST 3 STEPS\nTO GO',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 41.25,
                          height: 0.89,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }
}
