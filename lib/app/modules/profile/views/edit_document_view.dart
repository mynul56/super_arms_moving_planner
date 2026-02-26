import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../controllers/profile_controller.dart';

class EditDocumentView extends GetView<ProfileController> {
  const EditDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'Edit Document',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212529),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0x19EFB94C),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFEFB84B),
              size: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUploadSection(title: 'Upload Your ID Here'),
                const SizedBox(height: 24),
                _buildUploadSection(
                  title: 'Upload Your Business Registration Certificate',
                ),
                const SizedBox(height: 24),
                _buildUploadSection(title: 'Upload Your License'),
                const SizedBox(height: 24),
                _buildUploadSection(
                  title: 'Upload Your Special Moving Transport Insurance',
                ),
                const SizedBox(height: 24),
                _buildUploadSection(
                  title: 'Upload Your Social Security and Financial Reporting',
                ),
                const SizedBox(height: 24),
                _buildUploadSection(title: 'Upload Your Bank Account Details'),
                const SizedBox(height: 24),
                _buildUploadSection(title: 'Upload Your Truck Photo'),
                const SizedBox(height: 24),
                _buildTruckSizeSection(),
                const SizedBox(height: 32),
                _buildSubmitButton(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadSection({required String title}) {
    final String? imagePath = controller.uploadedDocuments[title];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 152,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B)),
            image: imagePath != null
                ? DecorationImage(
                    image: FileImage(File(imagePath)),
                    fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: NetworkImage('https://placehold.co/335x152'),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                text: 'Open camera',
                isPrimary: true,
                onTap: () => controller.pickImage(title, ImageSource.camera),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildActionButton(
                text: 'Upload File',
                isPrimary: false,
                onTap: () => controller.pickImage(title, ImageSource.gallery),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFFEFB84B) : null,
          borderRadius: BorderRadius.circular(16),
          border: isPrimary ? null : Border.all(color: const Color(0xFFEFB84B)),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isPrimary ? Colors.white : const Color(0xFFEFB84B),
          ),
        ),
      ),
    );
  }

  Widget _buildTruckSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Truck Size (in m',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF212529),
                ),
              ),
              TextSpan(
                text: '3',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF212529),
                  fontFeatures: [const FontFeature.enable('sups')],
                ),
              ),
              TextSpan(
                text: ')',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF212529),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 4,
          ), // Adjusted padding for TextField
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B)),
          ),
          child: TextField(
            onChanged: controller.updateTruckSize,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '30m³'.tr,
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF495057),
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF212529),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: controller.submitDocuments,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFB84B),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          'Submit',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
