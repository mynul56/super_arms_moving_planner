import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String mainImage;
  final bool isSvg;
  final List<Color> gradientColors;
  final Alignment gradientCenter;
  final double gradientRadius;
  final String? topIcon;
  final String? leftIcon;
  final String? rightIcon;
  final String? bottomIcon;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.mainImage,
    this.isSvg = false,
    required this.gradientColors,
    this.gradientCenter = const Alignment(0.4, -0.3),
    this.gradientRadius = 1.2,
    this.topIcon,
    this.leftIcon,
    this.rightIcon,
    this.bottomIcon,
  });
}

class OnboardingController extends GetxController {
  final currentIndex = 0.obs;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'Simple Workflow & Fast Payouts',
      description:
          'Follow the steps—arrive, load safely, take before/after photos, collect e‑signature, and deliver. Submit the job and get paid quickly',
      mainImage: 'assets/icons/onboard1.png',
      gradientColors: [const Color(0xFFA581FF), const Color(0xFF6C5DD3)],
      rightIcon: 'assets/icons/homeicon.png',
      leftIcon: 'assets/icons/treeicon.png',
    ),
    OnboardingPageModel(
      title: 'Jobs & Navigation',
      description:
          'See nearby requests with payout, distance, and time window. Review pickup/drop‑off details and follow optimized navigation to each stop.',
      mainImage: 'assets/icons/onboardcar2.png',
      isSvg: false,
      gradientColors: [const Color(0xFF77CDFF), const Color(0xFF288AC2)],
      rightIcon: 'assets/icons/faceicon.png',
      leftIcon: 'assets/icons/love.png',
      bottomIcon: 'assets/icons/car.png',
    ),
    OnboardingPageModel(
      title: 'Set Up Mover Profile',
      description:
          'Verify your account to start taking jobs. Upload your driver’s license and insurance, add your truck size and equipment, and set your service area and availability.',
      mainImage: 'assets/icons/onboard3.svg',
      isSvg: true,
      gradientColors: [const Color(0xFFFFC876), const Color(0xFFE74A00)],
      gradientCenter: const Alignment(-0.17, -0.10),
      gradientRadius: 1.90,
      topIcon: 'assets/icons/Shield Done.png',
      leftIcon: 'assets/icons/yollowlove.png',
      rightIcon: 'assets/icons/calendericon.png',
    ),
  ];

  void next() {
    if (currentIndex.value < pages.length - 1) {
      currentIndex.value++;
    } else {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }

  void skip() {
    Get.offAllNamed(Routes.SIGNIN);
  }
}
