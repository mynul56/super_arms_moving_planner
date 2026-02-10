import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Obx(() {
        final page = controller.pages[controller.currentIndex.value];
        return Stack(
          children: [
            // Top Gradient Background
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: Get.height * 0.55, // Use percentage of screen height
                decoration: ShapeDecoration(
                  gradient: RadialGradient(
                    center: page.gradientCenter,
                    radius: page.gradientRadius,
                    colors: page.gradientColors,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ),

            // Background Decoration Circle (Subtle)
            Positioned(
              left: Get.width * 0.2,
              top: Get.height * 0.15,
              child: Opacity(
                opacity: 0.15,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),

            // Main Illustration
            Positioned(
              left: 0,
              right: 0,
              top: Get.height * 0.12,
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    key: ValueKey(page.mainImage),
                    width: Get.width,
                    height: 280,
                    child: page.isSvg
                        ? SvgPicture.asset(page.mainImage, fit: BoxFit.contain)
                        : Image.asset(page.mainImage, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            // Top Icon Bubble (Shield for Page 3)
            if (page.topIcon != null)
              Positioned(
                left: 0,
                right: 150,
                top: Get.height * 0.04,
                child: Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(page.topIcon!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Left Icon Bubble with Glassmorphism
            if (page.leftIcon != null)
              Positioned(
                left: 10,
                top: Get.height * (page.bottomIcon != null ? 0.3 : 0.38),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Image.asset(page.leftIcon!),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Right Icon Bubble with Glassmorphism
            if (page.rightIcon != null)
              Positioned(
                right: 40,
                top: Get.height * (page.topIcon != null ? 0.22 : 0.15),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: Image.asset(page.rightIcon!),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Bottom Icon (Car for Page 2)
            if (page.bottomIcon != null)
              Positioned(
                left: 0,
                right: 0,
                top: Get.height * 0.42,
                child: Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.asset(page.bottomIcon!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Content section
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Get.height * 0.55,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    // Title Text
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1B1D21),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description Text
                    Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF495057),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),

                    // Page Indicator dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: controller.currentIndex.value == index
                              ? 28
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? const Color(0xFF3ABEFF)
                                : const Color(0xFFCBCBCB),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),

                    // Next Button
                    GestureDetector(
                      onTap: () => controller.next(),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3ABEFF),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3ABEFF).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            controller.currentIndex.value ==
                                    controller.pages.length - 1
                                ? 'Get Started'
                                : 'Next',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Skip Button with Glassmorphism
            Positioned(
              right: 20,
              top: MediaQuery.of(context).padding.top + 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    onTap: () => controller.skip(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Status bar clock (Optional visual polish)
          ],
        );
      }),
    );
  }
}
