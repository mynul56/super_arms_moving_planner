import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/live_tracking_controller.dart';
import '../../../routes/app_pages.dart';

class LiveTrackingView extends GetView<LiveTrackingController> {
  const LiveTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.moves.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final move = controller.moves[index];
                      return _buildMissionCard(move);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
          'LIVE TRACKING',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFEFB94C),
          ),
        ),
        const SizedBox(width: 44), // Placeholder for balance
      ],
    );
  }

  Widget _buildMissionCard(Map<String, dynamic> move) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID: ${move['id']}24769746ZX',
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
                          '€${move['price']}',
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
                          '${move['from']}',
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
                          '${move['to']}',
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
          ),
          const SizedBox(height: 12),
          _buildMissionDetails(move),
          const SizedBox(height: 12),
          _buildContinueButton(move),
        ],
      ),
    );
  }

  Widget _buildMissionDetails(Map<String, dynamic> move) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                Icons.calendar_today, // Placeholder icon
                'Date & Time',
                move['date_time'],
                const Color(0xFF0077FF),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                Icons.description, // Placeholder icon for "On Move" status
                'On Move',
                'Status',
                const Color(0xFF3ABEFF),
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
                move['distance'],
                const Color(0xFF1D04FE),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                Icons.local_shipping, // Placeholder for "Move" service type
                'Move',
                'Service Type',
                const Color(0xFFFF0004),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(
    dynamic icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF495057),
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

  Widget _buildContinueButton(Map<String, dynamic> move) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.UPDATE_STATUS, arguments: move),
      child: Container(
        width: double.infinity,
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
    );
  }
}
