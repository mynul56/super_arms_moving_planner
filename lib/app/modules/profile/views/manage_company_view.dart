import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';
import '../../../routes/app_pages.dart';

class ManageCompanyView extends GetView<ProfileController> {
  const ManageCompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'Manage Company',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Edit Your Company Name',
                controller: controller.companyNameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Edit Company Phone Number',
                controller: controller.companyPhoneController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Edit Company’s Current Address',
                controller: controller.companyAddressController,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      label: 'Edit Zip Code',
                      controller: controller.companyZipController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit State',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF212529),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEFB84B)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: 'New York',
                              isExpanded: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF212529),
                              ),
                              items: ['New York', 'California', 'Texas'].map((
                                String value,
                              ) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xFF495057),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildEmployeeSection(),
              const SizedBox(height: 24),
              _buildAddEmployeeButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B)),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Employee Details',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF212529),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFB84B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.edit, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: [
              _buildInfoRow(
                'Total Employee:',
                controller.employees.length.toString(),
              ),
              const SizedBox(height: 12),
              ...controller.employees.asMap().entries.map((entry) {
                final index = entry.key;
                final employee = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildEmployeeRow(
                    'Employee Info ${index + 1}:',
                    employee['name'] ?? '',
                    employee['role'] ?? '',
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
          ),
        ),
        Container(
          width: 189,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B)),
          ),
          child: Text(
            value,
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

  Widget _buildEmployeeRow(String label, String name, String role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildInfoRow(label, name),
        const SizedBox(height: 8),
        Container(
          width: 189, // Match the width of the value container in _buildInfoRow
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB84B)),
          ),
          child: Text(
            role,
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

  Widget _buildAddEmployeeButton() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.ADD_EMPLOYEE),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFB84B),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white, size: 24),
            const SizedBox(width: 8),
            Text(
              'Add Employee',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
