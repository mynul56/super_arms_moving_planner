import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_arms_moving_planner/app/routes/app_pages.dart';

import '../controllers/client_profile_controller.dart';

class ClientProfileView extends GetView<ClientProfileController> {
  const ClientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildStatisticsRow(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order History',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF212529),
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildOrderHistory(),
              const SizedBox(height: 20),
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
          Row(
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
              // Empty container for right alignment if searching isn't implemented details
              const SizedBox(width: 44),
            ],
          ),
          Text(
            'CLIENT PROFILE',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFEFB94C),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Obx(() {
      final client = controller.client.value;
      if (client == null) return const SizedBox.shrink();

      return Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
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
                child: client['image'] == null
                    ? const Icon(Icons.person, color: Colors.white, size: 50)
                    : null,
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFB94C).withOpacity(0.1),
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.chat_bubble,
                    size: 16,
                    color: const Color(0xFFEFB94C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Name: ${client['name']}',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF212529),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            client['address'] ?? 'Paris, France',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF495057),
              height: 1.5,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildStatisticsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildStatRowItem('Total Delivered', '100'),
          const SizedBox(height: 8),
          _buildStatRowItem('Total Canceled', '100'),
          const SizedBox(height: 8),
          _buildStatRowItem('On the move', '2'),
        ],
      ),
    );
  }

  Widget _buildStatRowItem(String label, String value) {
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
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFEFB94C),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderHistory() {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.orderHistory.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final order = controller.orderHistory[index];
          return _buildOrderCard(order);
        },
      );
    });
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E6DB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset('assets/images/box.png'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID: ${order['id']}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF212529),
                        height: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Moving price: ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFEFB94C),
                          ),
                        ),
                        Text(
                          order['price'],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFEFB94C),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Paris',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF495057),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Color(0xFF495057),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Paris',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF495057),
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
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  Icons.calendar_today,
                  'Date',
                  order['date'],
                  const Color(0xFF0077FF),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoItem(
                  Icons.access_time,
                  'Time',
                  order['time'],
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
                  'assets/icons/routes.svg', // using SVG path for distance if available, else Icon
                  'Distance',
                  order['distance'],
                  const Color(0xFF1D04FE),
                  isSvg: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: _buildStatusItem(order['status'])),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILS),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
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

Widget _buildInfoItem(
  dynamic icon,
  String label,
  String value,
  Color color, {
  bool isSvg = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: isSvg
              ? SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                )
              : Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF212529),
                ),
              ),
              Text(
                value,
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

Widget _buildStatusItem(String status) {
  Color color;
  IconData icon;

  switch (status) {
    case 'Delivered':
      color = const Color(0xFF38B000);
      icon = Icons.check_circle_outline;
      break;
    case 'On Move':
      color = const Color(0xFF3ABEFF);
      icon = Icons.local_shipping_outlined;
      break;
    case 'Canceled':
      color = const Color(0xFFE63946);
      icon = Icons.cancel_outlined;
      break;
    case 'Pending':
    default:
      color = const Color(0xFFEFB94C);
      icon = Icons.pending_outlined;
      break;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF212529),
                ),
              ),
              Text(
                'Status',
                style: GoogleFonts.poppins(
                  fontSize: 12,
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
