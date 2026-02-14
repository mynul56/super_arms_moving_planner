import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // Title Section
              Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter Your Email to Get Started',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF495057),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // Email Field
              _buildInputField(
                label: 'Email',
                hint: 'null@gmail.com',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Continue Button
              GestureDetector(
                // onTap: controller.OTP_Verification,
                onTap: () => Get.toNamed(Routes.PAYMENT),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
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
              const SizedBox(height: 32),

              // OR Divider
              Center(
                child: Text(
                  'OR',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF495057),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Sign In Footer
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.SIGNIN),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already Have An Account? ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF495057),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFEFB94C), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF495057),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
