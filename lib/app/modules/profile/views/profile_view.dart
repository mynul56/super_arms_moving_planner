import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assuming we have svgs or fall back to icons
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              Text(
                'Profile',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212529),
                ),
              ),
              const SizedBox(height: 24),
              _buildProfileInfo(),
              const SizedBox(height: 32),
              _buildActionButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          Text(
            'SUPER ARMS',
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0x19EFB94C),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFEFB84B),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/user.jpg',
                  ), // Use local asset if available, else network fallback
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(bottom: 5, right: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA), // White/Off-white
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Paris Movers',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF212529),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star, color: Color(0xFFEFB84B), size: 16),
            const SizedBox(width: 4),
            Text(
              '5/5',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF212529),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Member Since: April 2025',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF212529),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildActionButton(
            title: 'Edit profile',
            icon: Icons.edit_outlined,
            onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            title: 'Edit Document',
            icon: Icons.edit_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            title: 'Change password',
            icon: Icons.more_horiz,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            title: 'Edit Payment Information',
            icon: Icons.credit_card,
            onTap: () => Get.toNamed(Routes.UPDATE_CARD_INFO),
          ),
          const SizedBox(height: 16),
          _buildLogoutGroup(),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFB84B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: const Color(0xFFEFB84B)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutGroup() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFB84B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildGroupItem(
            title: 'Log Out',
            icon: Icons.logout,
            showBorder: true,
            onTap: () {
              _showConfirmationDialog(
                title: 'Are You Sure?',
                actionText: 'Log Out',
                actionColor: const Color(0xFFE33629),
                onAction: () {
                  Get.offAllNamed(Routes.SIGNIN);
                },
              );
            },
          ),
          _buildGroupItem(
            title: 'Delete Account',
            icon: Icons.delete_outline,
            showBorder: false,
            onTap: () {
              _showConfirmationDialog(
                title: 'Are You Sure?',
                actionText: 'Delete Account',
                actionColor: const Color(0xFFE33629),
                onAction: () {
                  Get.offAllNamed(Routes.SIGNIN);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGroupItem({
    required String title,
    required IconData icon,
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: showBorder
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.6),
                    width: 1,
                  ),
                ),
              )
            : null,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: const Color(0xFFEFB84B)),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog({
    required String title,
    required String actionText,
    required Color actionColor,
    required VoidCallback onAction,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 335,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
          decoration: ShapeDecoration(
            color: const Color(0xFFEFB84B),
            /* Primary-Color-3 */
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 287,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: onAction,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: ShapeDecoration(
                          color: actionColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          actionText,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14, // Slightly smaller font to fit
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'cancel', // Reverted to lowercase as per original request if needed, but keeping consistent
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14, // Slightly smaller font to fit
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
