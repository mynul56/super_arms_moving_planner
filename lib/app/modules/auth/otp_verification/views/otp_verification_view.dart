import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 6),

              // Back Button
              Row(
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
                      child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFEFB94C), size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Title Section
              Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'An Authentication code has been sent to null.gmail.com',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.only(left: index > 0 ? 13 : 0),
                    child: _buildOtpField(context, index),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit Button
              GestureDetector(
                onTap: controller.verifyOtp,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(color: const Color(0xFFEFB94C), borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resend OTP with Timer
              Obx(
                () => Center(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF495057),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(text: 'Code Sent. Resend Code In '),
                        TextSpan(
                          text: controller.timerText.value,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFEFB94C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, int index) {
    return Container(
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEFB94C), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.otpFocusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.poppins(color: const Color(0xFF212529), fontSize: 32, fontWeight: FontWeight.w600),
        decoration: const InputDecoration(border: InputBorder.none, counterText: ''),
        onChanged: (value) => controller.onOtpChanged(value, index),
      ),
    );
  }
}
