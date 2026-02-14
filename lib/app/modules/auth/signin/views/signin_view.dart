import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Static Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  // Back Button
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.offAllNamed(Routes.ONBOARDING),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFB94C).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xFFEFB94C),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Section
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Good To Have You Back, You’ve Been Missed',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF495057),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 48),

                    // Email Field
                    _buildInputField(
                      label: 'Email Address',
                      hint: 'null@gmail.com',
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),

                    // Password Field
                    Obx(
                      () => _buildInputField(
                        label: 'Password',
                        hint: '********',
                        controller: controller.passwordController,
                        isPassword: true,
                        obscureText: !controller.isPasswordVisible.value,
                        onToggleVisibility: controller.togglePasswordVisibility,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: controller.toggleRememberMe,
                          child: Row(
                            children: [
                              Obx(
                                () => Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: controller.rememberMe.value
                                        ? const Color(0xFFEFB84B)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: controller.rememberMe.value
                                          ? const Color(0xFFEFB84B)
                                          : const Color(0xFFD9D9D9),
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: controller.rememberMe.value
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Remember Me',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF495057),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFEFB84B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Log In Button
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.HOME),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFB84B),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFEFB84B).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
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

                    // Google Sign In Button
                    GestureDetector(
                      onTap: controller.signInWithGoogle,
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0x19EFB94C),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Continue With Google',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF212529),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Sign Up Footer
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.SIGN_UP),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t Have An Account? ',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF495057),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFEFB84B),
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
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType keyboardType = TextInputType.text,
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
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFF495057).withOpacity(0.5),
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: const Color(0xFFEFB84B).withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xFFEFB84B),
                width: 1.5,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF495057),
                      size: 20,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
