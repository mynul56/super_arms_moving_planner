import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/order_details_controller.dart';
import '../controllers/installment_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0x19EFB94C),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFFEFB84B),
              size: 24,
            ),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Order Details',
          style: GoogleFonts.poppins(
            color: const Color(0xFFEFB84B),
            fontSize: 26,
            fontWeight: FontWeight.w600,
            height: 1.40,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFFEFB84B),
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service title
              Center(
                child: Text(
                  controller.order.serviceName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF212529),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Offer Summary Card with background image
              _buildOfferSummaryCard(),

              const SizedBox(height: 32),

              // Payment Progress
              _buildPaymentProgress(),

              const SizedBox(height: 32),

              // Installments Section
              _buildInstallmentsSection(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfferSummaryCard() {
    return Container(
      width: double.infinity,
      height: 196,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1600518464441-9154a4dea21b?w=400&h=250&fit=crop",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Offer Summary',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
          Text(
            'Moving Date: ${DateFormat('MMM dd, yyyy').format(controller.order.orderDate)}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          Text(
            'Total Cost: €${controller.order.price.toStringAsFixed(0)}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentProgress() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0x19EFB94C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment progress',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF212529),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
                Text(
                  '${controller.paidInstallmentsCount}/${controller.totalInstallments} Paid',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF495057),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Progress bar
            Container(
              width: double.infinity,
              height: 13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: controller.paymentProgress,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB84B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstallmentsSection() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Installments',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x99848484), width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: controller.installments
                  .asMap()
                  .entries
                  .map(
                    (entry) => _buildInstallmentItem(
                      entry.value,
                      isFirst: entry.key == 0,
                      isLast: entry.key == controller.installments.length - 1,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstallmentItem(
    Installment installment, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    final isPaid = installment.status == InstallmentStatus.paid;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : const BorderSide(color: Color(0x99848484), width: 1),
        ),
      ),
      child: Row(
        children: [
          // Installment info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Installment ${installment.number}',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF212529),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isPaid && installment.paidDate != null
                      ? 'Paid: ${DateFormat('MMMM d, yyyy').format(installment.paidDate!)}'
                      : 'Pending',
                  style: GoogleFonts.poppins(
                    color: isPaid
                        ? const Color(0xFF495057)
                        : const Color(0xFFE63946),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Amount
          Text(
            '€${installment.amount.toStringAsFixed(0)}',
            style: GoogleFonts.poppins(
              color: isPaid ? const Color(0xFFEFB84B) : const Color(0xFFE63946),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),

          const SizedBox(width: 16),

          // Status badge
          Container(
            width: 102,
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPaid ? const Color(0xFFE1E1E1) : const Color(0xFFEFB84B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isPaid ? 'Paid' : 'Pending',
                style: GoogleFonts.poppins(
                  color: isPaid ? const Color(0xFF212529) : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
