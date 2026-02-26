import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_arms_moving_planner/app/routes/app_pages.dart';

import '../controllers/moving_planner_details_controller.dart';

class MovingPlannerDetailsView extends GetView<MovingPlannerDetailsController> {
  const MovingPlannerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.selectedMainTab.value == 0) {
                  return _buildDetailsContent();
                } else if (controller.selectedMainTab.value == 1) {
                  return _buildInventoryContent();
                } else if (controller.selectedMainTab.value == 2) {
                  return _buildMapContent();
                } else if (controller.selectedMainTab.value == 3) {
                  return _buildDescriptionContent();
                } else {
                  return Center(child: Text("Coming Soon".tr));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Details',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF212529),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildTabBar(),
          const SizedBox(height: 24),
          _buildClientProfile(),
          const SizedBox(height: 24),
          _buildOrderInfoCard(),
          const SizedBox(height: 24),
          _buildSelectedItemsSection(),
          const SizedBox(height: 24),
          _buildSpecialRequirementsCard(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildInventoryContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              'Details',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF212529),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildTabBar(),
          const SizedBox(height: 24),
          _buildSelectedItemsSection(),
        ],
      ),
    );
  }

  Widget _buildMapContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildTabBar(),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    height: 243,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              '5.2Km',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1B1D21),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.my_location,
                              color: Color(0xFF212529),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF495057),
                            size: 24,
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Flex(
                                  direction: Axis.vertical,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(3, (_) {
                                    return SizedBox(
                                      width: 1,
                                      height: 3,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: const Color(
                                            0xFF495057,
                                          ).withOpacity(0.3),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFF38B000),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 24,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '2045  Lodgeville Street, Eagan',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF212529),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 24,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '3329  Joyce Stree, PA, USA',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF212529),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildTabBar(),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF38B000),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Consignment Note',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF212529),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.WAYBILL),
                        child: const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF495057),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => controller.downloadWaybill(),
                        child: const Icon(
                          Icons.download_rounded,
                          color: Color(0xFF212529),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => _showConsignmentEditDialog(),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF212529),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConsignmentEditDialog() {
    final textController = TextEditingController(
      text: controller.consignmentNote.value,
    );
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 335,
          height: 276,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8E8E8E).withOpacity(0.33),
                blurRadius: 18.8,
                spreadRadius: -1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Consignment Note',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF212529),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF848484).withOpacity(0.6),
                    ),
                  ),
                  child: TextField(
                    controller: textController,
                    maxLines: null,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF212529),
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Enter note...'.tr,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  controller.updateConsignmentNote(textController.text);
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          Center(
            child: Text(
              'SUPER ARMS',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFEFB94C),
              ),
            ),
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
                        color: Color(0xFFFF5959),
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

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem(Icons.info_outline, 0),
          _buildTabItem(Icons.inventory_2_outlined, 1),
          _buildTabItem(Icons.map_outlined, 2),
          _buildTabItem(Icons.description_outlined, 3),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, int index) {
    return Obx(() {
      final isSelected = controller.selectedMainTab.value == index;
      return GestureDetector(
        onTap: () => controller.selectMainTab(index),
        child: Container(
          width: 62,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEFB94C) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: isSelected
                ? const Color(0xFFF8F9FA)
                : const Color(0xFF495057),
            size: 20,
          ),
        ),
      );
    });
  }

  Widget _buildClientProfile() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD9D9D9),
            image: DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/300'), // Placeholder
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C),
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 11),
            Text(
              'Chat with Client',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF212529),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Client Name: Al Muntakim',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Pickup Address: 270/2 Paris, France',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Delivery Address: 23/2 Paris, France',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '512KM Distance',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
      ],
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
                      Text(
                        // controller.serviceType.value might need to be "Moving Planner"
                        'Moving Planner', // Hardcoded as per design text, or use controller if it matches
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFEFB94C),
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
                assetPath: 'assets/icons/mail.svg',
                isSvg: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSelectedItemCard(
                'Move Out move\nIn Inspection',
                assetPath: 'assets/icons/move.svg',
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
                assetPath: 'assets/icons/well.svg',
                isSvg: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSelectedItemCard(
                'Personal\nAssistance',
                assetPath: 'assets/icons/personal.svg',
                isSvg: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
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
    String title, {
    String? assetPath,
    IconData? icon,
    bool isSvg = false,
  }) {
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
                  alignment: Alignment.center,
                  child: icon != null
                      ? Icon(icon, size: 32, color: const Color(0xFFEFB94C))
                      : isSvg
                      ? SvgPicture.asset(assetPath!, width: 40, height: 40)
                      : Image.asset(
                          assetPath!,
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
          const Divider(
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ), // Added lighter divider
          const SizedBox(height: 8),
          Obx(
            () => Text(
              controller.specialRequirements.value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFEFB94C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
