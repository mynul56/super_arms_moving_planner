import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/document_upload_controller.dart';

class DocumentUploadView extends GetView<DocumentUploadController> {
  const DocumentUploadView({super.key});

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
                      'Document Upload',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Seems You are New Here, Share Details With Us So That We can Validate your Company',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF6C757D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Upload sections
                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your ID Here',
                        onCamera: () => controller.openCamera('ID'),
                        onUpload: () => controller.uploadFile('ID'),
                        filePath: controller.idFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your Business Registration Certificate',
                        onCamera: () => controller.openCamera('Business Registration'),
                        onUpload: () => controller.uploadFile('Business Registration'),
                        filePath: controller.businessRegistrationFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your License',
                        onCamera: () => controller.openCamera('License'),
                        onUpload: () => controller.uploadFile('License'),
                        filePath: controller.licenseFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your Special Moving Transport Insurance',
                        onCamera: () => controller.openCamera('Insurance'),
                        onUpload: () => controller.uploadFile('Insurance'),
                        filePath: controller.insuranceFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your Social Security and Financial Reporting',
                        onCamera: () => controller.openCamera('Social Security'),
                        onUpload: () => controller.uploadFile('Social Security'),
                        filePath: controller.socialSecurityFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your Bank Account Details',
                        onCamera: () => controller.openCamera('Bank Account'),
                        onUpload: () => controller.uploadFile('Bank Account'),
                        filePath: controller.bankAccountFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Obx(
                      () => _buildUploadSection(
                        label: 'Upload Your Truck Photo',
                        onCamera: () => controller.openCamera('Truck Photo'),
                        onUpload: () => controller.uploadFile('Truck Photo'),
                        filePath: controller.truckPhotoFilePath.value,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Truck Size
                    Text(
                      'Truck Size (in m²)',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: Offset(0, 2))],
                      ),
                      child: TextField(
                        controller: controller.truckSizeController,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(color: Color(0xFF212529), fontSize: 15, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          hintText: '30m²',
                          hintStyle: GoogleFonts.poppins(
                            color: Color(0xFF6C757D).withOpacity(0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFFEFB94C).withOpacity(0.3), width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFFEFB94C), width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // Submit Button
                    GestureDetector(
                      onTap: controller.submit,
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFB94C),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Color(0xFFEFB94C).withOpacity(0.3), blurRadius: 12, offset: Offset(0, 6)),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection({
    required String label,
    required VoidCallback onCamera,
    required VoidCallback onUpload,
    required String filePath,
  }) {
    final bool hasFile = filePath.isNotEmpty;
    final String fileName = hasFile ? filePath.split('/').last : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: const Color(0xFF212529), fontSize: 16, fontWeight: FontWeight.w500, height: 1.4),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 130,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: hasFile ? const Color(0xFFEFB94C).withOpacity(0.05) : Colors.white,
            border: Border.all(
              color: hasFile ? const Color(0xFFEFB94C) : const Color(0xFFEFB94C).withOpacity(0.3),
              width: hasFile ? 2 : 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: const Color(0xFFEFB94C).withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: hasFile ? const Color(0xFFEFB94C) : const Color(0xFFEFB94C).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  hasFile ? Icons.check_circle : Icons.file_upload_outlined,
                  size: 28,
                  color: hasFile ? Colors.white : const Color(0xFFEFB94C),
                ),
              ),
              const SizedBox(height: 12),
              if (hasFile)
                Flexible(
                  child: Text(
                    fileName,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF212529),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              else
                Text(
                  'File Must be Under 10 Mb',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF6C757D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onCamera,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: const Color(0xFFEFB94C).withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        'Open camera',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: onUpload,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFEFB94C), width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload_file_outlined, size: 20, color: Color(0xFFEFB94C)),
                      const SizedBox(width: 8),
                      Text(
                        'Upload file',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFEFB94C),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
