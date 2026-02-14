import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDetailsView extends GetView {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine status color based on arguments or default
    final status = Get.arguments != null ? Get.arguments['status'] : 'Paid';
    Color statusColor;
    if (status == 'Paid') {
      statusColor = const Color(0xFF38B000);
    } else if (status == 'Pending') {
      statusColor = const Color(0xFFFFC107);
    } else {
      statusColor = const Color(0xFFEFB84B);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildInvoiceSection(status, statusColor),
                    const SizedBox(height: 24),
                    _buildPaymentInfoSection(),
                    const SizedBox(height: 24),
                    _buildRecipientInfoSection(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEFB84B),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 56), // Spacing from design
          Text(
            'Payments',
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

  Widget _buildInvoiceSection(String status, Color statusColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invoice',
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Trnx:', 'XXXXXXXX'),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Status: ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF212529),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: status,
                      style: GoogleFonts.poppins(
                        color: statusColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _buildDetailRow('Bank Name:', 'IFIC Bank'),
              const SizedBox(height: 8),
              _buildDetailRow('Account No:', '1101510253140'),
              const SizedBox(height: 8),
              _buildDetailRow('Date:', 'Aug 22, 2022'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Information',
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSummaryRow('Delivered Amount', '€25000'),
              const SizedBox(height: 16),
              _buildSummaryRow('Company Commission', '€6250'),
              const SizedBox(height: 16),
              _buildSummaryRow('Total Payed Amount', '€18750'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecipientInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipient Info',
          style: GoogleFonts.poppins(
            color: const Color(0xFF212529),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Al Muntaqim Tuhin',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Paris, France',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '+0158566352232',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label ',
            style: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
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
}
