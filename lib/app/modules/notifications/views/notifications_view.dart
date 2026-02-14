import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.isSettingsOpen.value) {
                  return _buildSettingsView();
                } else {
                  return _buildNotificationsList();
                }
              }),
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
              GestureDetector(
                onTap: () => controller.toggleSettings(),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFB94C).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xFFEFB94C),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'NOTIFICATION',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFEFB94C),
              height: 1.5,
              wordSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Today'),
            const SizedBox(height: 12),
            _buildGroupedList('today'),
            const SizedBox(height: 24),
            _buildSectionTitle('Yesterday'),
            const SizedBox(height: 12),
            _buildGroupedList('yesterday'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF000000),
        height: 1.5,
      ),
    );
  }

  Widget _buildGroupedList(String type) {
    final list = controller.notifications
        .where((n) => n['type'] == type)
        .toList();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return _buildNotificationItem(list[index]);
      },
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    final isBlue = notification['isBlue'] == true;
    final primaryColor = isBlue
        ? const Color(0xFF3ABEFF)
        : const Color(0xFFEFB94C);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(200),
          ),
          child: Icon(
            Icons.notifications_none_outlined,
            color: primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            notification['title'],
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF212529),
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          notification['time'],
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF77797A),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFB94C),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Receive notifications',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () => controller.toggleNotifications(
                  !controller.areNotificationsEnabled.value,
                ),
                child: Container(
                  width: 50,
                  height: 30,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment: controller.areNotificationsEnabled.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: controller.areNotificationsEnabled.value
                            ? const Color(0xFFEFB94C)
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
