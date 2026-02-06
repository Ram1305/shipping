import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
// import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button_decoration.dart';
import '../utils/colors.dart';
import '../utils/colors.dart' as Color;
import '../widgets/banner_carousel.dart';
import '../widgets/service_grid.dart';
import '../widgets/footer_widget.dart';
import '../widgets/utility_tools.dart';
import '../models/company_model.dart';
import '../models/log_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

/// Service menu items shown in the drawer (formerly right-side panel).
const List<String> _drawerServiceOptions = [
  'Ask Expert',
  'Flight Forwarded',
  'Linear',
  'CHA',
  'Transport',
  'MTO',
  'Consultant',
  'Agencies',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final companies = CompanyModel.getDummyCompanies();
    final logs = LogModel.getDummyLogs();
    final banners = [
      AppConstants.banner1,
      AppConstants.banner2,
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Yline Shipping',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primary,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            // Banner Carousel
            BannerCarousel(bannerPaths: banners),
            
            // Search bar and actions (mobile-friendly)
            Container(
              color: AppColors.cardBackground,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Search...',
                  //     hintStyle: GoogleFonts.inter(),
                  //     prefixIcon: const Icon(Icons.search),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(color: AppColors.borderColor),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(color: AppColors.borderColor),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(color: AppColors.primary, width: 2),
                  //     ),
                  //     filled: true,
                  //     fillColor: AppColors.background,
                  //     contentPadding: const EdgeInsets.symmetric(
                  //       horizontal: 16,
                  //       vertical: 14,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 32, // same height as your button
                          child: TextField(
                            style: GoogleFonts.inter(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: GoogleFonts.inter(fontSize: 12),
                              prefixIcon: const Icon(Icons.search, size: 18),
                              isDense: true, // reduces internal height
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColors.borderColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColors.borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColors.primary, width: 2),
                              ),
                              filled: true,
                              fillColor: AppColors.background,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline, size: 10),
                          label: Text(
                            'Post Enquiry',
                            style: GoogleFonts.inter(fontSize: 11),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            foregroundColor: AppColors.textWhite,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            minimumSize: const Size(0, 30), // height control
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // removes default extra space
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 1),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Navigate to send enquiry page
                          },
                          icon: const Icon(Icons.send, size: 14),
                          label: Text(
                            'Send Enquiry',
                            style: GoogleFonts.inter(fontSize: 11),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textWhite,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            minimumSize: const Size(0, 32), // controls height
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // removes default extra space
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
            
            // Service Grid
            const ServiceGrid(),
            // Container(
            //   height: 100,
            //   color: Colors.red,
            // ),
            // List Your Company Section
            Container(
              color: AppColors.cardBackground,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Center(
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () {
                    // TODO: Navigate to list company page
                  },
                  decoration: NeoPopTiltedButtonDecoration(
                    color: Color.AppColors.primary,
                    plunkColor: Color.AppColors.primary,
                    shadowColor: Color.AppColors.primary,
                    showShimmer: true,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70.0,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add_business,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'List Your Company for Free',
                          style: GoogleFonts.chewy(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BannerCarousel(bannerPaths: banners),
            // Company List
            // CompanyList(companies: companies),
            
            // Utility Tools, Recent Listings & Banners (single column for mobile)

            const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Yline Shipping',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Contact: info@yline.shipping',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textWhite.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary),
            title: Text(
              'Home',
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            onTap: () => Navigator.pop(context),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'Services',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          ..._drawerServiceOptions.map((option) => ListTile(
                leading: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.secondary,
                ),
                title: Text(
                  option,
                  style: GoogleFonts.inter(fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to service page for $option
                },
              )),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_add, color: AppColors.primary),
            title: Text('Register', style: GoogleFonts.inter()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to register
            },
          ),
          ListTile(
            leading: const Icon(Icons.login, color: AppColors.primary),
            title: Text('Login', style: GoogleFonts.inter()),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to login
            },
          ),
        ],
      ),
    );
  }
}

// class _LogCard extends StatelessWidget {
//   final LogModel log;

//   const _LogCard({required this.log});

//   Color _getLogColor() {
//     switch (log.type) {
//       case 'success':
//         return Colors.green;
//       case 'warning':
//         return Colors.orange;
//       case 'error':
//         return Colors.red;
//       default:
//         return AppColors.primary;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppColors.background,
//         borderRadius: BorderRadius.circular(8),
//         border: Border(
//           left: BorderSide(
//             color: _getLogColor(),
//             width: 4,
//           ),
//           top: BorderSide(color: AppColors.borderColor),
//           right: BorderSide(color: AppColors.borderColor),
//           bottom: BorderSide(color: AppColors.borderColor),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 8,
//             height: 8,
//             margin: const EdgeInsets.only(top: 6, right: 12),
//             decoration: BoxDecoration(
//               color: _getLogColor(),
//               shape: BoxShape.circle,
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   log.message,
//                   style: GoogleFonts.inter(
//                     fontSize: 14,
//                     color: AppColors.textPrimary,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   log.formattedTime,
//                   style: GoogleFonts.inter(
//                     fontSize: 12,
//                     color: AppColors.textSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
