import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/moving_planner_details_controller.dart';

class MovingPlannerDetailsView extends GetView<MovingPlannerDetailsController> {
  const MovingPlannerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildClientInfo(),
                    const SizedBox(height: 24),
                    _buildOrderInfoCard(),
                    const SizedBox(height: 24),
                    _buildSelectedItemsSection(),
                    const SizedBox(height: 24),
                    _buildSpecialRequirementsCard(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFB94C).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Color(0xFFEFB94C),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'SUPER ARMS',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEFB94C),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    color: Color(0xFFEFB94C),
                    size: 24,
                  ),
                  Positioned(
                    top: 10,
                    right: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientInfo() {
    return Column(
      children: [
        // Tab Bar Placeholder (Info, Box, Map, Document) - visual only for now as per design
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEFB94C).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTabIcon(Icons.info_outline, true),
              _buildTabIcon(Icons.inventory_2_outlined, false),
              _buildTabIcon(Icons.map_outlined, false),
              _buildTabIcon(Icons.description_outlined, false),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/user.jpg',
              ), // Ensure asset exists or use placeholder
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: controller.onChatWithClient,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFB94C),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  'Chat with Client',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(
                      0xFF212529,
                    ), // Dark text on yellow button per design
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => Text(
            'Client Name: ${controller.clientName.value}',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF212529),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Text(
            'Pickup Address: ${controller.pickupAddress.value}',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Obx(
          () => Text(
            'Delivery Address: ${controller.deliveryAddress.value}',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Obx(
          () => Text(
            controller.distance.value,
            textAlign: TextAlign.center,
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

  Widget _buildTabIcon(IconData icon, bool isSelected) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEFB94C) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : const Color(0xFF495057),
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E6DB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/box.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      'Order ID: ${controller.orderId.value}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF212529),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Service Type: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF212529),
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.serviceType.value,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFEFB94C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildInfoGridItem(
                  Icons.calendar_today_outlined,
                  'Date',
                  controller.moveDate.value,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoGridItem(
                  Icons.access_time_outlined,
                  'Time',
                  controller.moveTime.value,
                  const Color(0xFFEFB94C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildInfoGridItem(
                  Icons.inventory_2_outlined,
                  controller.boxCount.value,
                  'Standard box',
                  const Color(0xFF1D04FE),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoGridItem(
                  Icons.description_outlined,
                  'Pending',
                  'Status',
                  const Color(0xFF212529),
                ),
              ), // Icon needs to be more specific if possible
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoGridItem(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF212529),
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF495057),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Items',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSelectedItemCard(
                'Mail Forwarding',
                'assets/icons/love.png',
              ),
            ), // Need correct assets
            const SizedBox(width: 16),
            Expanded(
              child: _buildSelectedItemCard(
                'Move Out move\nIn Inspection',
                'assets/icons/cameraicon.svg',
                isSvg: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSelectedItemCard(
                'Well Being\nSupport',
                'assets/icons/personal.png',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSelectedItemCard(
                'Personal\nAssistance',
                'assets/icons/man.png',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Items:',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF495057),
                ),
              ),
              Text(
                '04 items',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFEFB94C),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedItemCard(
    String title,
    String assetPath, {
    bool isSvg = false,
  }) {
    // Note: Implementing without assets being verified might show placeholders
    // Based on directory list, we have: love.png, personal.png, man.png. cameraicon.svg.
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image/Icon placeholder
                Container(
                  width: 40,
                  height: 40,
                  // simplified asset loading for prototype
                  child: isSvg
                      ? const Icon(
                          Icons.camera_alt,
                          color: Colors.orange,
                          size: 30,
                        )
                      : Image.asset(
                          assetPath,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image, color: Colors.orange),
                        ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Color(0xFFEFB94C), size: 18),
        ],
      ),
    );
  }

  Widget _buildSpecialRequirementsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Requirements',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Text(
              controller.specialRequirements.value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFEFB94C), // Orange text as per design
              ),
            ),
          ),
        ],
      ),
    );
  }
}
