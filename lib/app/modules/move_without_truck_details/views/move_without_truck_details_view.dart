import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_arms_moving_planner/app/routes/app_pages.dart';

import '../controllers/move_without_truck_details_controller.dart';

class MoveWithoutTruckDetailsView
    extends GetView<MoveWithoutTruckDetailsController> {
  const MoveWithoutTruckDetailsView({Key? key}) : super(key: key);
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Details'.tr,
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
            _buildParkingFacility(),
            const SizedBox(height: 24),
            _buildAdditionalServices(),
            const SizedBox(height: 24),
            _buildVehicleOption(),
            const SizedBox(height: 24),
            _buildSpecialRequirements(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Details'.tr,
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
            _buildSelectedFurnitures(),
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
              'Chat with Client'.tr,
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
          'Client Name:'.tr + ' Al Muntakim',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Pickup Address:'.tr + ' 270/2 Paris, France',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Delivery Address:'.tr + ' 23/2 Paris, France',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '512KM ' + 'Distance'.tr,
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                padding: const EdgeInsets.all(14),
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
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID:'.tr + ' 124769746ZX',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF212529),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Moving price: '.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF212731),
                          ),
                        ),
                        Text(
                          '€480',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFEFB94C),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Service type: '.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF212731),
                          ),
                        ),
                        Text(
                          'Moves(Military)',
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
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Info Grid
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  Icons.calendar_today,
                  'Date'.tr,
                  'Aug 28, Sat',
                  const Color(0xFF0077FF),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoItem(
                  Icons.access_time,
                  'Time'.tr,
                  '9 Am',
                  const Color(0xFFEFB94C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  Icons.work_outline,
                  '03',
                  'Standard box'.tr,
                  const Color(0xFF1D04FE),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoItem(
                  Icons.pending_actions,
                  'Pending',
                  'Status'.tr,
                  const Color(0xFFEFB94C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 8),
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

  Widget _buildParkingFacility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Parking Facility'.tr,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF212529),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF848484).withOpacity(0.6)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Tabs
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => GestureDetector(
                        onTap: () =>
                            controller.selectParkingTab('Pickup Point'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    controller.selectedParkingTab.value ==
                                        'Pickup Point'
                                    ? const Color(0xFFEFB94C)
                                    : const Color(0xFF848484).withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Pickup Point',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color:
                                    controller.selectedParkingTab.value ==
                                        'Pickup Point'
                                    ? const Color(0xFF212529)
                                    : const Color(0xFF6C757D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectParkingTab('Destination'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    controller.selectedParkingTab.value ==
                                        'Destination'
                                    ? const Color(0xFFEFB94C)
                                    : const Color(0xFF848484).withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Destination',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color:
                                    controller.selectedParkingTab.value ==
                                        'Destination'
                                    ? const Color(0xFF212529)
                                    : const Color(0xFF6C757D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Content
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    _buildFeatureItem('Home Type:'.tr, 'Studio 20m²'),
                    _buildFeatureItem('Floor:'.tr, '3rd'),
                    _buildFeatureItem(
                      'Loading Truck parking:'.tr,
                      'Parking space'.tr,
                    ),
                    _buildFeatureItem(
                      'Heavy Truck parking'.tr,
                      'I don’t know'.tr,
                    ),
                    _buildFeatureItem('Distance of parking:'.tr, '30-40m'),
                    _buildFeatureItem('Any stops:'.tr, 'Yes'.tr),
                    _buildFeatureItem('Celler storage room:'.tr, 'Yes'.tr),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFFEFB94C),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
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
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF495057),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalServices() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF848484).withOpacity(0.6)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF848484).withOpacity(0.6),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Additional Service'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                _buildFeatureItem('Provide Boxes:'.tr, 'Yes'.tr),
                _buildFeatureItem('Wardrope boxes:'.tr, 'Yes'.tr),
                _buildFeatureItem('Setup Furniture:'.tr, 'Yes'.tr),
                _buildFeatureItem('Fragile Item packing:'.tr, 'Yes'.tr),
                _buildFeatureItem('Non-Fragile Item packing:'.tr, 'Yes'.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleOption() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF848484).withOpacity(0.6)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF848484).withOpacity(0.6),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Vehicle option'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: _buildFeatureItem('No Vehicle Needed'.tr, '1 item'.tr),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialRequirements() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF848484).withOpacity(0.6)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF848484).withOpacity(0.6),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Special Requirements'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Move very Carefully.'.tr,
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

  Widget _buildSelectedFurnitures() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF848484).withOpacity(0.6)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF848484).withOpacity(0.6),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Selected Furnitures'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                _buildFeatureItem('3-seater sofa:'.tr, '1 item'.tr),
                _buildFeatureItem('Painting:'.tr, '1 item'.tr),
                _buildFeatureItem('Chair:'.tr, '1 item'.tr),
                _buildFeatureItem('Tea Table:'.tr, '1 item'.tr),
                _buildFeatureItem('Vass:'.tr, '1 item'.tr),
                _buildFeatureItem('Tree:'.tr, '1 item'.tr),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Items:'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF495057),
                  ),
                ),
                Text(
                  '06 items'.tr,
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
                'Details'.tr,
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
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFB94C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFFEFB94C),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup Point'.tr,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF6C757D),
                              ),
                            ),
                            Text(
                              '270/2 Paris, France'.tr,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF212529),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFB94C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFFEFB94C),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Destination'.tr,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF6C757D),
                              ),
                            ),
                            Text(
                              '23/2 Paris, France'.tr,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF212529),
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
                'Details'.tr,
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
                      'Consignment Note'.tr,
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
    Get.defaultDialog(
      title: 'Edit Consignment Note'.tr,
      titleStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: controller.consignmentNote.value,
              onChanged: (value) => controller.updateConsignmentNote(value),
              decoration: InputDecoration(
                hintText: 'Enter note'.tr,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEFB94C),
              ),
              child: Text(
                'Save'.tr,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
