import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
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
                      const SizedBox(height: 24),
                      _buildImages(),
                      const SizedBox(height: 40),
                    ],
                  ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEFB94C),
                size: 20,
              ),
            ),
          ),
          Text(
            'Details',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF212529),
              height: 1.4,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_outlined,
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
          _buildTabItem(Icons.info_outline, true),
          _buildTabItem(Icons.inventory_2_outlined, false),
          _buildTabItem(Icons.map_outlined, false),
          _buildTabItem(Icons.description_outlined, false),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, bool isSelected) {
    return Container(
      width: 62,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEFB94C) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFFF8F9FA) : const Color(0xFF495057),
        size: 20,
      ),
    );
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
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E6DB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.local_shipping, // Using generic icon
                  color: Color(0xFFEFB94C),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID: 124769746ZX',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF212529),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      children: [
                        Text(
                          'Moving price: ',
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
                        const SizedBox(width: 10),
                        Text(
                          'Service type: ',
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
                  'Date',
                  'Aug 28, Sat',
                  const Color(0xFF0077FF),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoItem(
                  Icons.access_time,
                  'Time',
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
                  'Standard box',
                  const Color(0xFF1D04FE),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoItem(
                  Icons.pending_actions,
                  'Pending',
                  'Status',
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
          alignment: Alignment.centerRight,
          child: Text(
            'Parking Facility',
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
                    _buildFeatureItem('Home Type:', 'Studio 20m²'),
                    _buildFeatureItem('Floor:', '3rd'),
                    _buildFeatureItem(
                      'Loading Truck parking:',
                      'Parking space',
                    ),
                    _buildFeatureItem('Heavy Truck parking', 'I don’t know'),
                    _buildFeatureItem('Distance of parking:', '30-40m'),
                    _buildFeatureItem('Any stops:', 'Yes'),
                    _buildFeatureItem('Celler storage room:', 'Yes'),
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
                  'Additional Service',
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
                _buildFeatureItem('Provide Boxes:', 'Yes'),
                _buildFeatureItem('Wardrope boxes:', 'Yes'),
                _buildFeatureItem('Setup Furniture:', 'Yes'),
                _buildFeatureItem('Fragile Item packing:', 'Yes'),
                _buildFeatureItem('Non-Fragile Item packing:', 'Yes'),
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
                  'Vehicle option',
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
            child: _buildFeatureItem('No Vehicle Needed', '1 item'),
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
                  'Special Requirements',
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
              'Move very Carefully.',
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

  Widget _buildImages() {
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
                  'Image',
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
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildImageItem(),
                const SizedBox(height: 10),
                _buildImageItem(),
                const SizedBox(height: 10),
                _buildImageItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem() {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFD9D9D9),
        image: const DecorationImage(
          image: AssetImage('assets/images/moving_boxes.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
