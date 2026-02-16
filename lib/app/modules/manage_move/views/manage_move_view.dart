import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_arms_moving_planner/app/modules/manage_move/controllers/manage_move_controller.dart';


class ManageMoveView extends GetView<ManageMoveController> {
  const ManageMoveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildOrderHistoryHeader(),
                    const SizedBox(height: 16),
                    Obx(() => _buildOrdersList()),
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
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: const Color(0x19EFB94C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFEFB84B),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 42),
          Text(
            'MANAGE MOVE',
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = ['All', 'On Move', 'Delivered', 'Cancelled'];

    return Container(
      height: 50,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: List.generate(tabs.length, (index) {
            return Obx(() {
              final isSelected = controller.selectedTabIndex.value == index;
              return GestureDetector(
                onTap: () => controller.selectTab(index),
                child: Container(
                  margin: EdgeInsets.only(
                    right: index < tabs.length - 1 ? 8 : 0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: ShapeDecoration(
                    color: isSelected
                        ? const Color(0xFFEFB84B)
                        : const Color(0x19EFB94C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    tabs[index],
                    style: GoogleFonts.poppins(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFFEFB84B),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }

  Widget _buildOrderHistoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order History',
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
        ),
        GestureDetector(
          onTap: () => controller.viewAllMoves(),
          child: Text(
            'See All',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersList() {
    final orders = controller.filteredMoves;

    if (orders.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: SvgPicture.asset(
                'assets/icons/inventory.svg',
                colorFilter: ColorFilter.mode(
                  const Color(0xFF9A9C9D).withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No orders found',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xFF9A9C9D),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildOrderCard(orders[index]),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0x19EFB94C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        children: [
          _buildOrderHeader(order),
          const SizedBox(height: 12),
          _buildOrderDetails(order),
          const SizedBox(height: 12),
          _buildAssignMoverButton(order),
        ],
      ),
    );
  }

  Widget _buildOrderHeader(Map<String, dynamic> order) {
    return Row(
      children: [
        Container(
          height: 52,
          padding: const EdgeInsets.all(14),
          decoration: ShapeDecoration(
            color: const Color(0xFFF7E6DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/box.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: ${order['id']}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF212529),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                    ),
                  ),
                  if (order.containsKey('rating'))
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(
                            'assets/icons/star.svg',
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFEFB84B),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${order['rating']}',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFEFB84B),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Moving price:',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFEFB84B),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '€${order['price']}',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFEFB84B),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '${order['route']['from']} ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF495057),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF495057),
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      order['route']['to'],
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF495057),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                      overflow: TextOverflow.ellipsis,
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

  Widget _buildOrderDetails(Map<String, dynamic> order) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDetailContainer(
                'assets/icons/calendar.svg',
                'Date & Time',
                order['date'],
                const Color(0x190077FF),
                const Color(0xFF0077FF),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 151.50,
              child: _buildDetailContainer(
                'assets/icons/service_type.svg',
                order['serviceType'],
                'Service Type',
                const Color(0x19FF0004),
                const Color(0xFFFF0004),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDetailContainer(
                'assets/icons/routes.svg',
                'Distance',
                order['distance'],
                const Color(0x191D04FE),
                const Color(0xFF1D04FE),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 151.50,
              child: _buildDetailContainer(
                _getStatusIcon(order['status']),
                _getStatusText(order['status']),
                'Status',
                _getStatusBackgroundColor(order['status']),
                _getStatusColor(order['status']),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailContainer(
    dynamic icon,
    String title,
    String subtitle,
    Color backgroundColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: icon is String
                ? (icon.startsWith('material_icon_')
                    ? Icon(
                        icon == 'material_icon_cancel'
                            ? Icons.cancel_outlined
                            : Icons.help_outline,
                        color: iconColor,
                        size: 24,
                      )
                    : SvgPicture.asset(
                      icon,
                      colorFilter:
                          ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ))
                : Icon(icon as IconData, color: iconColor, size: 24),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF212529),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF495057),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignMoverButton(Map<String, dynamic> order) {
    return GestureDetector(
      onTap: () => controller.selectMover(order['id']),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFFEFB84B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          'Assign Mover',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.50,
          ),
        ),
      ),
    );
  }

  String _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return 'assets/icons/star.svg';
      case 'onmove':
        return 'assets/icons/service_type.svg';
      case 'canceled':
        return 'material_icon_cancel';
      case 'pending':
        return 'assets/icons/calendar.svg';
      default:
        return 'material_icon_help';
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return 'Delivered';
      case 'onmove':
        return 'On Move';
      case 'canceled':
        return 'Canceled';
      case 'pending':
        return 'Pending';
      default:
        return 'Unknown';
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF38B000);
      case 'onmove':
        return const Color(0xFF3ABEFF);
      case 'canceled':
        return const Color(0xFFE63946);
      case 'pending':
        return const Color(0xFFEFB94C);
      default:
        return const Color(0xFF6c757d);
    }
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0x1938B000);
      case 'onmove':
        return const Color(0x193ABEFF);
      case 'canceled':
        return const Color(0x19E63946);
      case 'pending':
        return const Color(0x19EFB94C);
      default:
        return const Color(0x196c757d);
    }
  }
}
