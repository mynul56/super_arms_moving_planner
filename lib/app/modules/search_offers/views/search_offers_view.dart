import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/search_offers_controller.dart';

class SearchOffersView extends GetView<SearchOffersController> {
  const SearchOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          _buildHeader(),
          Positioned(
            top: 129,
            left: 20,
            right: 20,
            child: _buildPickupSection(),
          ),
          Positioned(
            top: 233,
            left: 20,
            right: 20,
            child: _buildDropOffSection(),
          ),
          Positioned(
            top: 345,
            left: 20,
            right: 20,
            child: _buildViewOffersButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 60), // Status bar padding approx
        Stack(
          alignment: Alignment.center,
          children: [
            Row(children: [const SizedBox(width: 20), _buildBackButton()]),
            Text(
              'SEARCH OFFERS',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFEFB94C),
                height: 1.4,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFEFB94C).withOpacity(0.1),
          borderRadius: BorderRadius.circular(200),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFFEFB94C),
          ),
        ),
      ),
    );
  }

  Widget _buildPickupSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Up Destination',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => _buildLocationInput(
            controller.pickUpLocation.value,
            isPickup: true,
          ),
        ),
      ],
    );
  }

  Widget _buildDropOffSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Drop Off Destination',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => _buildLocationInput(
            controller.dropOffLocation.value,
            isPickup: false,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInput(String location, {required bool isPickup}) {
    return GestureDetector(
      onTap: () => _showLocationPicker(isPickup),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEFB94C)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined, color: Color(0xFF495057)),
            const SizedBox(width: 12),
            Text(
              location,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF495057),
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Color(0xFF212529)),
          ],
        ),
      ),
    );
  }

  void _showLocationPicker(bool isPickup) {
    Get.bottomSheet(
      Container(
        height: 600,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFEFB94C),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Select Location',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: controller.locations.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, color: Color(0xFFE5E5E5)),
                itemBuilder: (context, index) {
                  final location = controller.locations[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      location,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF212529),
                      ),
                    ),
                    onTap: () {
                      if (isPickup) {
                        controller.updatePickUpLocation(location);
                      } else {
                        controller.updateDropOffLocation(location);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildViewOffersButton() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'View Offers',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
