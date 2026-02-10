import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFF8F9FA)),
        child: Stack(
          children: [
            // Gradient Background
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.00, 0.00),
                    radius: 1.44,
                    colors: [Colors.white, Color(0xFFF3D096)],
                  ),
                ),
              ),
            ),
            // We use a FittedBox to ensure the specific 375x812 design scales correctly on any screen size
            Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: 375,
                  height: 812,
                  child: Stack(
                    children: [
                      // Decorative Circle 1
                      Positioned(
                        left: 300,
                        top: 559,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Logo
                      Positioned(
                        left: 0,
                        top: 60,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            width: 185,
                            child: Image.asset(
                              "assets/icons/Logos.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      // Main Content Background
                      Positioned(
                        left: 72,
                        top: 372,
                        child: Container(
                          width: 231,
                          height: 220,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      // Main Car Image
                      Positioned(
                        left: 45,
                        top: 392,
                        child: SizedBox(
                          width: 300,
                          height: 180,
                          child: SvgPicture.asset(
                            "assets/icons/splashcar.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Decorative Circle 2
                      Positioned(
                        left: 71,
                        top: 551,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Decorative Circle 3
                      Positioned(
                        left: 162,
                        top: 581,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Large Faint Circle
                      Positioned(
                        left: 81,
                        top: 427,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 220,
                            height: 220,
                            decoration: const ShapeDecoration(
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                      // Content Container (Empty in snippet but kept for structure)
                      Positioned(
                        left: 60.70,
                        top: 601.42,
                        child: Container(
                          width: 275.30,
                          height: 24.13,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const Stack(),
                        ),
                      ),
                      // Face Icon Background
                      Positioned(
                        left: 235,
                        top: 280,
                        child: Container(
                          width: 72,
                          height: 72,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Face Icon Image
                      Positioned(
                        left: 242,
                        top: 285,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/faceicon.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Car Icon Background
                      Positioned(
                        left: 111,
                        top: 628,
                        child: Container(
                          width: 66,
                          height: 66,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Car Icon (Small) - Replacing Text('🚙')
                      Positioned(
                        left: 100,
                        top: 646,
                        child: SizedBox(
                          width: 70,
                          height: 70, // Approximate size based on FontSize 30
                          child: Image.asset(
                            "assets/icons/car.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Heart Icon Background
                      Positioned(
                        left: 53,
                        top: 290,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.10),
                            shape: const OvalBorder(),
                          ),
                        ),
                      ),
                      // Heart Icon - Replacing Text('❤️')
                      Positioned(
                        left: 62,
                        top:
                            298, // Adjusted slightly to center if needed, sticking to snippet coords implies top-left alignment
                        child: SizedBox(
                          width: 18,
                          height: 18, // Approximate size based on FontSize 18
                          child: Image.asset(
                            "assets/icons/love.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
