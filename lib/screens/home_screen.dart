import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/header_widget.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/service_grid.dart';
import '../widgets/company_list.dart';
import '../widgets/footer_widget.dart';
import '../widgets/utility_tools.dart';
import '../models/company_model.dart';
import '../models/log_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderWidget(),
            
            // Banner Carousel
            BannerCarousel(bannerPaths: banners),
            
            // Search bar, Post Enquiry, and Send Enquiry in a straight line
            Container(
              color: AppColors.cardBackground,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  // Search text box
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: GoogleFonts.inter(),
                        prefixIcon: const Icon(Icons.search),
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
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Post Enquiry button
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to post enquiry page
                    },
                    icon: const Icon(Icons.add_circle_outline),
                    label: Text(
                      'Post Enquiry',
                      style: GoogleFonts.inter(),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: AppColors.textWhite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Send Enquiry button
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Navigate to send enquiry page
                    },
                    icon: const Icon(Icons.send),
                    label: Text(
                      'Send Enquiry',
                      style: GoogleFonts.inter(),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Service Grid
            const ServiceGrid(),
            
            // List Your Company Section
            Container(
              color: AppColors.cardBackground,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to list company page
                  },
                  icon: const Icon(Icons.add_business),
                  label: Text(
                    'List Your Company for Free',
                    style: GoogleFonts.inter(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: AppColors.textWhite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            
            // Company List
            // CompanyList(companies: companies),
            
            // Utility Tools, Recent Listings & Banner Section
            Container(
              color: AppColors.background,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Utility Tools and Recent Listings
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Utility Tools Section
                        const UtilityTools(),
                        const SizedBox(height: 20),
                        // Recent Listings Section
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Listings',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.background,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.inventory,
                                            color: AppColors.secondary,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              'Listing ${index + 1}: New shipment available',
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Right: Banner ListView
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: banners.length,
                          itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: index == banners.length - 1 ? 0 : 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                banners[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 120,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 120,
                                    color: AppColors.primary.withOpacity(0.2),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            size: 48,
                                            color: AppColors.primary,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Banner ${index + 1}',
                                            style: GoogleFonts.inter(
                                              color: AppColors.primary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
            
            // Logs Section
            // Container(
            //   color: AppColors.cardBackground,
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Activity Logs',
            //         style: GoogleFonts.inter(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: AppColors.primary,
            //         ),
            //       ),
            //       const SizedBox(height: 15),
            //       SizedBox(
            //         height: 300,
            //         child: ListView.builder(
            //           itemCount: logs.length,
            //           itemBuilder: (context, index) {
            //             final log = logs[index];
            //             return _LogCard(log: log);
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            
            // Footer
            const FooterWidget(),
          ],
        ),
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
