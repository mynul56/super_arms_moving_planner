import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'main_drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFB94C),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: _buildHeader(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(),
                  const SizedBox(height: 16),
                  _buildStartDayCard(),
                  const SizedBox(height: 24),
                  _buildServicesSection(),
                  const SizedBox(height: 24),
                  _buildCurrentMissionsSection(),
                  const SizedBox(height: 24),
                  _buildStatisticsSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: const Color(0xFFEFB94C),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenuButton(),
              const SizedBox(width: 8),
              _buildBalanceChip(),
            ],
          ),
          _buildNotificationButton(),
        ],
      ),
    );
  }

  Widget _buildMenuButton() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Container(
          width: 40,
          height: 40,
          child: SvgPicture.asset('assets/icons/menu.svg'),
        ),
      ),
    );
  }

  Widget _buildBalanceChip() {
    return GestureDetector(
      onTap: () => controller.toggleBalance(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        constraints: const BoxConstraints(minWidth: 140),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFFEFB94C),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '€',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Obx(
              () => Text(
                controller.isBalanceVisible.value
                    ? '€${controller.balance.value.toStringAsFixed(0)}'
                    : 'Tap for balance',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xFF495057),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
      child: SizedBox(
        width: 40,
        height: 40,
        child: SvgPicture.asset('assets/icons/notification.svg'),
      ),
    );
  }

  Widget _buildGreeting() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'Hello, ${controller.userName.value.split(' ')[0]}',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF212529),
              height: 1.5,
            ),
          ),
          Text(
            'Here Is Your Job For Today',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF495057),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartDayCard() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFEFB94C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start your Day',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'View Offers',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 30,
          bottom: 0,
          child: Icon(
            Icons.local_shipping,
            size: 120,
            color: Colors.white.withOpacity(0.25),
          ),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212529),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildServiceItemSvg(
              'assets/icons/location-tracking.svg',
              'Live\nTracking',
              onTap: () => Get.toNamed(Routes.LIVE_TRACKING),
            ),
            _buildServiceItemSvg(
              'assets/icons/routes.svg',
              'Routes',
              onTap: () => Get.toNamed(Routes.ROUTE),
            ),
            _buildServiceItemSvg(
              'assets/icons/clients.svg',
              'Clients',
              onTap: () => Get.toNamed(Routes.CLIENTS),
            ),
            _buildServiceItemSvg(
              'assets/icons/payment.svg',
              'Payment',
              onTap: () => Get.toNamed(Routes.PAYMENT),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceItemSvg(
    String svgPath,
    String label, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFEFB94C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(svgPath),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 68,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF212529),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentMissionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Current Missions',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF212529),
                height: 1.4,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/available-offers'),
              child: Text(
                'See All',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFFEFB94C),
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.upcomingMoves.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final move = controller.upcomingMoves[index];
              return _buildMissionCard(move);
            },
          ),
        ),
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
                          '€480',
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
                          'Service type: ',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFEFB94C),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Movers',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFEFB94C),
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
          _buildContinueButton(),
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
                Icons.calendar_today,
                'Date',
                move['date'],
                const Color(0xFF0077FF),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                Icons.access_time,
                'Time',
                '9 Am',
                const Color(0xFFEFB94C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDetailItem(
                'assets/icons/inventory.svg',
                '${move['items']}',
                'Standard box',
                const Color(0xFF1D04FE),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailItem(
                'assets/icons/service_type.svg',
                move['status'],
                'Service Type',
                const Color(0xFF00DBEE),
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
      padding: const EdgeInsets.all(6),
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
            child: icon is String
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  )
                : Icon(icon as IconData, color: color, size: 20),
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
                    height: 1.5,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF495057),
                    height: 1.5,
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

  Widget _buildContinueButton() {
    return Container(
      width: double.infinity,
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
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF212529),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'assets/icons/mission.svg',
                      '${controller.activeMoves.value}',
                      'Missions',
                      const Color(0xFF0077FF),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStatCard(
                      'assets/icons/routes.svg',
                      '506',
                      'Km',
                      const Color(0xFFEFB94C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'assets/icons/trending_up.svg',
                      'In 2 Days',
                      'Upcoming',
                      const Color(0xFF1D04FE),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildStatCard(
                      'assets/icons/star.svg',
                      '4.8',
                      'Rating',
                      const Color(0xFF04FE3A),
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

  Widget _buildStatCard(dynamic icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFB94C).withOpacity(0.1),
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
            child: icon is String
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  )
                : Icon(icon as IconData, color: color, size: 20),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF212529),
                    height: 1.5,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF495057),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
