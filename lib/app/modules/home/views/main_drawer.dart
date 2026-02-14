import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 267,
      backgroundColor: const Color(0xFFF9F9F9),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildMenuItems(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 60, // Proper safe area top padding
        left: 26,
        right: 37,
        bottom: 28,
      ),
      decoration: const BoxDecoration(color: Color(0xFFDAAE66)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/user.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Paris Movers',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'parismovers003@gmail.com',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person_outline_rounded,

            title: 'Profile',
            onTap: () {
              Get.back(); // Close drawer
              Get.toNamed(Routes.PROFILE);
            },
          ),
          _buildMenuItem(
            icon: Icons.wallet_outlined,
            title: 'Installments',
            onTap: () {
              Get.back();
            },
          ),
          _buildMenuItem(
            icon: Icons.inventory_2_outlined,
            title: 'Inventory',
            onTap: () {
              Get.back();
            },
          ),
          _buildMenuItem(
            icon: Icons.business_outlined,
            title: 'Manage Company',
            onTap: () {
              Get.back();
            },
          ),
          _buildMenuItem(
            icon: Icons.local_shipping_outlined,
            title: 'Manage Move',
            onTap: () {
              Get.back();
            },
          ),
          _buildMenuItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Get.offAllNamed(Routes.SIGNIN);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xFF9A9C9D), size: 24),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: const Color(0xFF030709),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }
}
