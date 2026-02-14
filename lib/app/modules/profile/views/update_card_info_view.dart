import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';

class UpdateCardInfoView extends GetView<ProfileController> {
  const UpdateCardInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                ), // Matches left: 21
                child: Text(
                  'Update Card information',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF212529),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildCardForm(),
              const SizedBox(height: 48),
              _buildUpdateButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: GestureDetector(
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
    );
  }

  Widget _buildCardForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0x19EFB94C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _buildCardNumberSection(),
            const SizedBox(height: 16),
            _buildNameSection(),
            const SizedBox(height: 16),
            _buildCountrySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardNumberSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Information',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFB703),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Colors
                .white, // Assuming white background for inputs inside the form
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border(
              top: BorderSide(color: Color(0xFFFFB703), width: 1),
              left: BorderSide(color: Color(0xFFFFB703), width: 1),
              right: BorderSide(color: Color(0xFFFFB703), width: 1),
              bottom: BorderSide(color: Color(0xFFFFB703), width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.credit_card, size: 20, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '4242 5859 5684 5555',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF495057),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF495057),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Icon(
                Icons.check_circle,
                size: 20,
                color: Color(0xFF212529),
              ), // Placeholder for the stacked icons
            ],
          ),
        ),
        Container(
          height: 56,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border(
                      left: BorderSide(color: Color(0xFFFFB703), width: 1),
                      right: BorderSide(
                        color: Color(0xFFFFB703),
                        width: 1,
                      ), // Middle border
                      bottom: BorderSide(color: Color(0xFFFFB703), width: 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'MM/YY',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF495057),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF495057),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border(
                      right: BorderSide(color: Color(0xFFFFB703), width: 1),
                      bottom: BorderSide(color: Color(0xFFFFB703), width: 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'CVC',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF495057),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF495057),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNameSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name On Card',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFB703),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFFFB703), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter Name',
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade400,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountrySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country or region',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFFFB703),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border(
              top: BorderSide(color: Color(0xFFFFB703), width: 1),
              left: BorderSide(color: Color(0xFFFFB703), width: 1),
              right: BorderSide(color: Color(0xFFFFB703), width: 1),
              bottom: BorderSide(color: Color(0xFFFFB703), width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value:
                          controller.countries.contains(
                            controller.selectedCountry.value,
                          )
                          ? controller.selectedCountry.value
                          : null,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black54,
                      ),
                      isExpanded: true,
                      hint: Text(
                        'Select Country',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF495057),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedCountry.value = newValue;
                        }
                      },
                      items: controller.countries.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF495057),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            border: Border(
              left: BorderSide(color: Color(0xFFFFB703), width: 1),
              right: BorderSide(color: Color(0xFFFFB703), width: 1),
              bottom: BorderSide(color: Color(0xFFFFB703), width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: TextField(
            decoration: InputDecoration(
              hintText: '10001',
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF495057),
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 52, // Slightly adjusted height to align with design usually
          decoration: BoxDecoration(
            color: const Color(0xFFEFB84B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Update Now',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
