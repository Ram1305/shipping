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

    final rightSideOptions = [
      'Ask Expert',
      'Flight Forwarded',
      'Linear',
      'CHA',
      'Transport',
      'MTO',
      'Consultant',
      'Agencies',
    ];

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Service Grid
          Expanded(
            flex: 3,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 9,
                childAspectRatio: 1.2,
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
          ),
          const SizedBox(width: 20),
          // Right Side: Options List
          Expanded(
            flex: 1,
            child: Container(
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
                    'Services',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...rightSideOptions.map((option) => _OptionCard(
                        title: option,
                      )),
                ],
              ),
            ),
          ),
        ],
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
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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

class _OptionCard extends StatelessWidget {
  final String title;

  const _OptionCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to option page
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.secondary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textPrimary,
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
