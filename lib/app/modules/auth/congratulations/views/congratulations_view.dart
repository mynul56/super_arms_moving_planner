import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/congratulations_controller.dart';

class CongratulationsView extends GetView<CongratulationsController> {
  const CongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFB94C).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFFEFB94C)),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success Icon
                  SizedBox(
                    width: 193,
                    height: 193,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer circle
                        Container(
                          width: 193,
                          height: 193,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF3AE15D).withOpacity(0.1)),
                        ),
                        // Middle circle
                        Container(
                          width: 153,
                          height: 153,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF3AE15D).withOpacity(0.1)),
                        ),
                        // Inner circle
                        Container(
                          width: 111,
                          height: 111,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF3AE15D).withOpacity(0.1)),
                        ),
                        // Success illustration with gradient
                        Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [Color(0xFFD5FB3A), Color(0xFF4FBF67)],
                              center: Alignment.topLeft,
                              radius: 1.0,
                            ),
                          ),
                          child: const Icon(Icons.check, size: 50, color: Colors.white),
                        ),
                        // Decorative elements
                        // Top right triangle
                        Positioned(
                          top: 20,
                          right: 30,
                          child: Transform.rotate(
                            angle: 0.26,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(color: Color(0xFFAAE849), shape: BoxShape.circle),
                            ),
                          ),
                        ),
                        // Top left yellow rectangle
                        Positioned(
                          top: 10,
                          right: 70,
                          child: Transform.rotate(
                            angle: 0.28,
                            child: Container(
                              width: 16,
                              height: 22,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD0F93C),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        // Top right green triangle
                        Positioned(
                          top: 16,
                          right: 10,
                          child: Transform.rotate(
                            angle: 1.27,
                            child: Container(
                              width: 19,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFF78D25A),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        // Bottom right green circle
                        Positioned(
                          bottom: 30,
                          right: 40,
                          child: Container(
                            width: 11,
                            height: 11,
                            decoration: const BoxDecoration(color: Color(0xFF8DDB52), shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Congratulations',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1B1D21),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Admin Has Approved Your Request. From Now You Can Provide Moving Service.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Welcome box button
                  GestureDetector(
                    onTap: () => controller.navigateToHome(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 64),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFB94C).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Welcome To Super Arms.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFEFB94C),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
