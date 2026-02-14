import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              Text(
                'Edit Profile',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
              const SizedBox(height: 32),
              _buildForm(),
              const SizedBox(height: 48),
              _buildSaveButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEFB84B),
                size: 20,
              ),
            ),
          ),
          Text(
            'SUPER ARMS',
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0x19EFB94C),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFEFB84B),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildTextField(label: 'Edit Full Name', initialValue: 'Al Muntakim'),
          const SizedBox(height: 24),
          _buildTextField(
            label: 'Edit Phone Number',
            initialValue: '+4364654557',
          ),
          const SizedBox(height: 24),
          _buildTextField(
            label: 'Edit Current Address',
            initialValue: '270/7, Paris',
          ),
          const SizedBox(height: 24),
          _buildTextField(label: 'Edit Zip Code', initialValue: '13463'),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B), width: 1),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              initialValue,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF495057),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFEFB84B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'Save',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
