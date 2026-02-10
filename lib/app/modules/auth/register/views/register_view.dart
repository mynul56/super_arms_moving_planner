import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const ShapeDecoration(color: Color(0x19EFB94C), shape: CircleBorder()),
                          child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Color(0xFFEFB84B)),
                        ),
                      ),
                      Text(
                        'Register',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF212529),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 44),
                    ],
                  ),
                  const SizedBox(height: 32),
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
                    Text(
                      'Getting Started',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Seems You are New Here, Let's Set Up Your Profile",
                      style: GoogleFonts.poppins(color: const Color(0xFF495057), fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 32),

                    // Form Fields
                    _buildInputField(
                      label: 'Full Name',
                      hint: 'Enter your full name',
                      controller: controller.fullNameController,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      label: 'Phone Number',
                      hint: 'Enter your phone number',
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      label: 'Current Address',
                      hint: 'Enter your address',
                      controller: controller.addressController,
                    ),
                    const SizedBox(height: 20),

                    // Zip and State Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildInputField(
                            label: 'Zip Code',
                            hint: 'Zip Code',
                            controller: controller.zipCodeController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF212529),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Obx(
                                () => GestureDetector(
                                  onTap: () => _showStateSelector(context),
                                  child: Container(
                                    height: 56,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: const Color(0xFFEFB84B).withOpacity(0.4)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.selectedState.value,
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xFF495057),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Icon(Icons.keyboard_arrow_down, color: Color(0xFF495057), size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

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
                    Obx(
                      () => _buildInputField(
                        label: 'Confirm Password',
                        hint: '********',
                        controller: controller.confirmPasswordController,
                        isPassword: true,
                        obscureText: !controller.isConfirmPasswordVisible.value,
                        onToggleVisibility: controller.toggleConfirmPasswordVisibility,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Terms & Conditions
                    GestureDetector(
                      onTap: controller.toggleTerms,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                color: controller.agreeToTerms.value ? const Color(0xFFEFB84B) : Colors.transparent,
                                border: Border.all(
                                  color: controller.agreeToTerms.value ? const Color(0xFFEFB84B) : const Color(0xFFD9D9D9),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: controller.agreeToTerms.value
                                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'By Creating Account You Agree To Our ',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF495057),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Terms And Conditions',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFFEFB84B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Continue Button
                    GestureDetector(
                      onTap: controller.register,
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
                            'Continue',
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
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
          style: GoogleFonts.poppins(color: const Color(0xFF212529), fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: GoogleFonts.poppins(color: const Color(0xFF212529), fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: const Color(0xFF495057).withOpacity(0.5), fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: const Color(0xFFEFB84B).withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFEFB84B), width: 1.5),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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

  void _showStateSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Handle Bar
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: const Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(2)),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select State',
                    style: GoogleFonts.poppins(color: const Color(0xFF212529), fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Color(0xFF495057)),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEFEFEF)),
            // States List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: controller.states.length,
                itemBuilder: (context, index) {
                  final state = controller.states[index];
                  return Obx(() {
                    final isSelected = controller.selectedState.value == state;
                    return GestureDetector(
                      onTap: () {
                        controller.selectedState.value = state;
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFEFB84B).withOpacity(0.1) : Colors.transparent,
                          border: Border(
                            left: BorderSide(color: isSelected ? const Color(0xFFEFB84B) : Colors.transparent, width: 3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state,
                              style: GoogleFonts.poppins(
                                color: isSelected ? const Color(0xFFEFB84B) : const Color(0xFF212529),
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                            if (isSelected) const Icon(Icons.check_circle, color: Color(0xFFEFB84B), size: 20),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
