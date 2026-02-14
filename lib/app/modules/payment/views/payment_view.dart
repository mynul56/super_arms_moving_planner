import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        _buildWalletCard(),
                        const SizedBox(height: 24),
                        _buildBalanceSummary(),
                        const SizedBox(height: 24),
                        _buildPaymentHistoryHeader(),
                        const SizedBox(height: 16),
                        _buildFilterChips(),
                        const SizedBox(height: 16),
                        _buildTransactionList(),
                        const SizedBox(height: 100), // Space for bottom button
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C), // 10% opacity of primary
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEFB84B),
                size: 20,
              ),
            ),
          ),
          Text(
            'Payments',
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 44), // Spacer for centering
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDF9F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'My wallet',
            style: GoogleFonts.poppins(
              color: const Color(0xFF495057),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '€25000',
            style: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'You can request payment for this Amount',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF495057),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Balance Summary',
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Total Amount', '€25000'),
        const SizedBox(height: 16),
        _buildSummaryRow('Company Commission', '€6250'),
        const SizedBox(height: 16),
        _buildSummaryRow('Total Payable Amount', '€18750'),
        const SizedBox(height: 16),
        _buildSummaryRow('Clearable Consignment', '15'),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: const Color(0xFFEFB84B),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentHistoryHeader() {
    return Text(
      'Payment History',
      style: GoogleFonts.poppins(
        color: const Color(0xFF212529),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Paid', 'Pending', 'Clearable Consignment'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return Obx(() {
            final isSelected = controller.selectedFilter.value == filter;
            return GestureDetector(
              onTap: () => controller.changeFilter(filter),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFEFB84B)
                      : const Color(0x19EFB94C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  filter,
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : const Color(0xFFEFB84B),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Obx(() {
      final transactions = controller.filteredTransactions;
      if (transactions.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'No transactions found',
              style: GoogleFonts.poppins(
                color: const Color(0xFF495057),
                fontSize: 14,
              ),
            ),
          ),
        );
      }
      return Column(
        children: transactions.map((tx) {
          Color statusColor;
          if (tx['status'] == 'Paid') {
            statusColor = const Color(0xFFEFB84B);
          } else if (tx['status'] == 'Pending') {
            statusColor = const Color(0xFFFFC107);
          } else {
            statusColor = const Color(0xFFEFB84B);
          }

          return Column(
            children: [
              _buildTransactionCard(
                id: tx['id'],
                amount: tx['amount'],
                status: tx['status'],
                statusColor: statusColor,
              ),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      );
    });
  }

  Widget _buildTransactionCard({
    required String id,
    required String amount,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F3EA), // Light beige background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0x19EFB94C),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: const Color(0xFFEFB84B),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trnx ID: $id', // Use provided ID
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Status: ',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF495057),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: status,
                            style: GoogleFonts.poppins(
                              color: statusColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      amount,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF495057),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFEFB84B)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () => Get.toNamed(
                Routes.PAYMENT_DETAILS,
                arguments: {'id': id, 'amount': amount, 'status': status},
              ),
              child: Center(
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFEFB84B),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: controller.requestPayment,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFEFB84B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              'Payment Request',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
