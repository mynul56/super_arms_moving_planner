import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/main_navigation_controller.dart';
import '../../home/views/home_view.dart';
import '../../payment/views/payment_view.dart';
import '../../schedule/views/schedule_view.dart';
import '../../chat/views/chat_view.dart';
import '../../home/views/main_drawer.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeView(),
      const PaymentView(),
      const ScheduleView(),
      const ChatView(),
    ];

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const MainDrawer(),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFC7C7C7), width: 0.6)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItemSvg(
              'assets/icons/home.svg',
              'Home',
              0,
              controller.selectedIndex.value == 0,
            ),
            _buildNavItemSvg(
              'assets/icons/paymenticon.svg',
              'Payments',
              1,
              controller.selectedIndex.value == 1,
            ),
            _buildNavItemSvg(
              'assets/icons/calendar.svg',
              'Schedule',
              2,
              controller.selectedIndex.value == 2,
            ),
            _buildNavItemSvg(
              'assets/icons/chatnavbar.svg',
              'Chat',
              3,
              controller.selectedIndex.value == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItemSvg(
    String svgPath,
    String label,
    int index,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                svgPath,
                colorFilter: ColorFilter.mode(
                  isActive ? const Color(0xFFEFB94C) : const Color(0xFF787878),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isActive
                    ? const Color(0xFFEFB94C)
                    : const Color(0xFF787878),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
