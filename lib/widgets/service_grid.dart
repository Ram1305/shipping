import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'name': 'Sea', 'icon': AppConstants.iconSea},
      {'name': 'Air', 'icon': AppConstants.iconAir},
      {'name': 'Road', 'icon': AppConstants.iconRoad},
      {'name': 'Courier', 'icon': AppConstants.iconCourier},
      {'name': 'Share the Space', 'icon': AppConstants.iconShareSpace},
      {'name': 'Warehouse', 'icon': AppConstants.iconWarehouse},
      {'name': 'Jobs', 'icon': AppConstants.iconJobs},
      {'name': 'Rental', 'icon': AppConstants.iconRental},
    ];

    return Container(
      color: AppColors.background,
      // padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return _ServiceCard(
            name: service['name']!,
            iconPath: service['icon']!,
          );
        },
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String name;
  final String iconPath;

  const _ServiceCard({
    required this.name,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to service page
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  iconPath,
                  // width: 48,
                  // height: 48,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.local_shipping,
                      size: 30,
                      color: AppColors.primary,
                    );
                  },
                ),
              ),
              // const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  // fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

