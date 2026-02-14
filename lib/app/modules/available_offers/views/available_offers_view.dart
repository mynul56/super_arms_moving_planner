import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/available_offers_controller.dart';

class AvailableOffersView extends GetView<AvailableOffersController> {
  const AvailableOffersView({super.key});

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
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildFilterTabs(),
                    const SizedBox(height: 32),
                    _buildOffersList(),
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
            'AVAILABE OFFERS',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFEFB94C),
              height: 1.4,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.SEARCH_OFFERS),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Icon(
                Icons.search,
                color: Color(0xFFEFB94C),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SizedBox(
      height: 33,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.tabs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tab = controller.tabs[index];
          return Obx(() {
            final isSelected = controller.selectedTab.value == tab;
            return GestureDetector(
              onTap: () => controller.selectTab(tab),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFEFB94C)
                      : const Color(0xFFEFB94C).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  tab,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFFEFB94C),
                    height: 1.5,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildOffersList() {
    return Obx(() {
      // Access observables directly within Obx for proper tracking
      final currentTab = controller.selectedTab.value;
      final allOffers = controller.offers;

      // Filter offers based on selected tab
      final filteredOffers = currentTab == 'All'
          ? allOffers
          : allOffers
                .where((offer) => offer['serviceType'] == currentTab)
                .toList();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredOffers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final offer = filteredOffers[index];
            return _buildOfferCard(offer);
          },
        ),
      );
    });
  }

  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOfferHeader(offer),
          const SizedBox(height: 12),
          _buildOfferDetails(offer),
          const SizedBox(height: 12),
          _buildOfferActions(offer),
        ],
      ),
    );
  }

  Widget _buildOfferHeader(Map<String, dynamic> offer) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFFF7E6DB),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(
            Icons.local_shipping,
            color: Color(0xFFEFB94C),
            size: 24,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: ${offer['id']}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF212529),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Moving price: ',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFEFB94C),
                      height: 1.5,
                    ),
                  ),
                  Text(
                    offer['price'],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFEFB94C),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    offer['from'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF495057),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Color(0xFF495057),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    offer['to'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF495057),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferDetails(Map<String, dynamic> offer) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                Icons.calendar_today,
                'Date',
                offer['date'],
                const Color(0xFF0077FF),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                Icons.access_time,
                'Time',
                offer['time'],
                const Color(0xFFEFB94C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                Icons.route,
                'Distance',
                offer['distance'],
                const Color(0xFF1D04FE),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                Icons.check_circle_outline,
                offer['serviceType'],
                'Service Type',
                Color(offer['serviceColor']),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(6),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF212529),
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF495057),
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferActions(Map<String, dynamic> offer) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILS),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEFB94C)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFEFB94C),
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => controller.onChat(offer),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Chat',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
