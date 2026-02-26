import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              // Title
              Text(
                'Choose Your Preferred\nLanguage'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
              Text(
                'Select a language to customize your\nexperience and navigation.'
                    .tr,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF495057),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),

              // Language options
              Obx(
                () => _buildLanguageOption(
                  'English'.tr,
                  'United States'.tr,
                  '🇬🇧', // Based on the UI matching UK flag for English
                  controller.selectedLanguage.value == 'English',
                  () => controller.changeLanguage('English'),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => _buildLanguageOption(
                  'Français'.tr,
                  'France'.tr,
                  '🇫🇷',
                  controller.selectedLanguage.value == 'Français',
                  () => controller.changeLanguage('Français'),
                ),
              ),

              const Spacer(),

              // Continue Button
              GestureDetector(
                onTap: controller.onContinue,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Continue'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    String language,
    String country,
    String flagEmoji,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 88,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF8EA) : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFFEFB94C)
                : const Color(0xFFD9D9D9),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Flag Icon Container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(flagEmoji, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 16),
            // Text Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    language,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF212529),
                      height: 1.4,
                    ),
                  ),
                  Text(
                    country,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF495057),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            // Checkmark or empty circle
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFEFB94C)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFEFB94C)
                      : const Color(0xFFD9D9D9),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
