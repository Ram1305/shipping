import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final footerLinks = [
      'Home',
      'About Us',
      'Contact Us',
      'Listing Policy',
      'Terms of User',
      'Privacy Policy',
      'FAQ',
      'Advertise with Us',
      'Careers',
      'Forum',
      'Help & Support',
    ];

    final socialIcons = [
      Icons.facebook,
      Icons.alternate_email, // Twitter alternative
      Icons.business, // LinkedIn alternative
      Icons.camera_alt, // Instagram alternative
      Icons.share,
    ];

    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // Footer Links
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 15,
            children: footerLinks.map((link) {
              return InkWell(
                onTap: () {
                  // TODO: Navigate to respective pages
                },
                child: Text(
                  link,
                  style: GoogleFonts.inter(
                    color: AppColors.textWhite,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          // Share Options
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Share:',
                style: GoogleFonts.inter(
                  color: AppColors.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 15),
              ...socialIcons.map((icon) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: () {
                      // TODO: Implement share functionality
                    },
                    icon: Icon(
                      icon,
                      color: AppColors.textWhite,
                      size: 24,
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          // Copyright
          Text(
            '© 2026 Yline Shipping. All rights reserved.',
            style: GoogleFonts.inter(
              color: AppColors.textWhite.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
