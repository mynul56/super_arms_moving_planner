import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/waybill_controller.dart';

class WaybillView extends GetView<WaybillController> {
  const WaybillView({Key? key}) : super(key: key);
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection1(),
                    const SizedBox(height: 24),
                    _buildSection2(),
                    const SizedBox(height: 24),
                    _buildSection3(),
                    const SizedBox(height: 24),
                    _buildSection4(),
                    const SizedBox(height: 24),
                    _buildSection5(),
                    const SizedBox(height: 24),
                    _buildSection6(),
                    const SizedBox(height: 24),
                    _buildSection7(),
                    const SizedBox(height: 40),
                    _buildBottomButton(),
                    const SizedBox(height: 20),
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFB94C).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Color(0xFFEFB94C),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'SUPER ARMS',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEFB94C),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Waybill',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEFB94C).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
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
                        color: Colors.red,
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

  Widget _buildSection1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Information About The mover',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoRow('Company Name:', 'Super Arms'),
        const SizedBox(height: 8),
        _buildInfoRow('Adress:', 'Paris, France'),
        const SizedBox(height: 8),
        _buildInfoRow('Siret:', '323032030'),
      ],
    );
  }

  Widget _buildSection2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2. Information About The Client',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoRow('Name:', 'Al Muntakim'),
        const SizedBox(height: 8),
        _buildInfoRow('Adress:', 'Paris, France'),
      ],
    );
  }

  Widget _buildSection3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3. Location And Date Of The Move',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        _buildInputRow('Departure Address:', 'Paris, France'),
        const SizedBox(height: 12),
        _buildInputRow('Arrival Address:', 'Paris, France'),
        const SizedBox(height: 12),
        _buildInputRow('Moving Date:', '12/09/2025 8Am'),
      ],
    );
  }

  Widget _buildSection4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '4. Description Of The Service',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        _buildInputRow('Estimated Volume:', '23m³'),
        const SizedBox(height: 12),
        _buildInputRow('number Of Movers:', '3'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Equipment Used:',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF212529),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFFEFB94C),
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Boxes',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildInputRow('Particularities:', 'Move with Care'),
      ],
    );
  }

  Widget _buildSection5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5. Condition Report',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        _buildInputRow('Note On Arrival:', 'Some Text'),
      ],
    );
  }

  Widget _buildSection6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5. Consignment Report', // Note: Design has two "5." sections? Or maybe it's 6. "Consignment Report". The image shows "5. Consignment Report" after "5. Condition Report". I'll use "5. Consignment Report" as per image.
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 126,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB94C)),
          ),
          child: Text(
            'A Painting Was Scratches',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF212529),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection7() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5. Signatures', // Again "5." in design? I'll stick to image content.
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 16),
        _buildSignatureBlock('Movers Signature'),
        const SizedBox(height: 24),
        _buildSignatureBlock('Client Signature'),
      ],
    );
  }

  Widget _buildSignatureBlock(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text('Done At', style: _labelStyle()),
            const SizedBox(width: 8),
            Expanded(child: _dashedLine()),
            const SizedBox(width: 8),
            Text('on', style: _labelStyle()),
            const SizedBox(width: 8),
            SizedBox(width: 30, child: _dashedLine()),
            Text('/', style: _labelStyle()),
            SizedBox(width: 30, child: _dashedLine()),
            Text('/', style: _labelStyle()),
            SizedBox(width: 30, child: _dashedLine()),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text('Name:', style: _labelStyle()),
            const SizedBox(width: 8),
            Expanded(child: _dashedLine()),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text('Signature:', style: _labelStyle()),
            const SizedBox(width: 8),
            Expanded(child: _dashedLine()),
          ],
        ),
      ],
    );
  }

  TextStyle _labelStyle() {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF212529),
    );
  }

  Widget _dashedLine() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: const Color(0xFF495057)),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
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
            fontWeight: FontWeight.w400,
            color: const Color(0xFF495057),
          ),
        ),
      ],
    );
  }

  Widget _buildInputRow(String label, String value) {
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
        Container(
          width: 189,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFB94C)),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF212529),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return GestureDetector(
      onTap: () => _showSignatureDialog(),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFEFB94C),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          'Start The Signature Process',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showSignatureDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 335,
          height: 512,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8E8E8E).withOpacity(0.33),
                blurRadius: 18.8,
                offset: const Offset(0, 0),
                spreadRadius: -1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign Waybill(Consignment Note)',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF212529),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF848484).withOpacity(0.6),
                    ),
                  ),
                  // Placeholder for signature pad
                  child: Container(),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Clear signature logic
                      },
                      child: Text(
                        'Clear',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFEFB94C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFEFB94C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Confirm logic
                  Get.back();
                },
                child: Container(
                  width: 113,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
