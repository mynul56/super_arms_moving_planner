import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/installment_controller.dart';

class InstallmentView extends GetView<InstallmentController> {
  const InstallmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'Installments',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212529),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0x19EFB94C),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFEFB84B),
              size: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildServiceSummaryGrid(),
              const SizedBox(height: 32),
              _buildFilterTabs(),
              const SizedBox(height: 24),
              _buildOrderList(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceSummaryGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildServiceCard(
              ServiceType.regularMoves,
              controller.getServiceTypeCount(ServiceType.regularMoves),
            ),
            _buildServiceCard(
              ServiceType.movingPlanner,
              controller.getServiceTypeCount(ServiceType.movingPlanner),
            ),
            _buildServiceCard(
              ServiceType.concierge,
              controller.getServiceTypeCount(ServiceType.concierge),
            ),
            _buildServiceCard(
              ServiceType.moveWithoutTruck,
              controller.getServiceTypeCount(ServiceType.moveWithoutTruck),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(ServiceType type, int count) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: controller.getServiceTypeColor(type),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF212529),
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              controller.getServiceTypeName(type),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF212529),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['All Moves', 'On Move', 'Delivered'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: tabs.map((tab) => _buildTab(tab)).toList()),
    );
  }

  Widget _buildTab(String label) {
    return Obx(() {
      final isSelected = controller.selectedFilter.value == label;

      return GestureDetector(
        onTap: () => controller.setFilter(label),
        child: Container(
          margin: const EdgeInsets.only(right: 32),
          child: Column(
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? const Color(0xFF212529)
                      : const Color(0xFF6C757D),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 3,
                width: label.length * 8.0,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFEFB84B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildOrderList() {
    return Obx(() {
      final orders = controller.filteredOrders;

      if (orders.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              'No orders found',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6C757D),
              ),
            ),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return _buildOrderCard(orders[index]);
        },
      );
    });
  }

  Widget _buildOrderCard(Order order) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ORDER_DETAILS, arguments: order);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Box icon
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFB84B).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/images/box.png', fit: BoxFit.contain),
            ),
            const SizedBox(width: 16),
            // Order details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order.orderNumber}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF212529),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.serviceName,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF6C757D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${order.price.toStringAsFixed(0)}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFEFB84B),
                    ),
                  ),
                ],
              ),
            ),
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: controller.getStatusColor(order.status),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                controller.getStatusText(order.status),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
