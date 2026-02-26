import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  const ClientsView({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      child: Text(
                        'Clients History'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF212529),
                          height: 1.5,
                        ),
                      ),
                    ),
                    _buildFilterTabs(),
                    const SizedBox(height: 16),
                    _buildClientsList(),
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
            'CLIENTS'.tr,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFEFB94C),
              height: 1.5,
              letterSpacing: 1.0,
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEFB94C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Icon(Icons.search, color: Color(0xFFEFB94C), size: 24),
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
                  tab.tr,
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

  Widget _buildClientsList() {
    return Obx(() {
      final clients = controller.filteredClients;
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: clients.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final client = clients[index];
          return _buildClientCard(client);
        },
      );
    });
  }

  Widget _buildClientCard(Map<String, dynamic> client) {
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
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: client['image'] != null
                      ? DecorationImage(
                          image: AssetImage(client['image']),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                // Fallback icon if image fails or is missing in asset
                child: client['image'] == null
                    ? const Icon(Icons.person, color: Colors.white, size: 30)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:'.tr + ' ${client['name']}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF212529),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Address:'.tr + ' ${client['address']}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF495057),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      (client['serviceType'] as String).tr,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF495057),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => controller.onViewProfile(client),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'View Profile'.tr,
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
        ],
      ),
    );
  }
}
