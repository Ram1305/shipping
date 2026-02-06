import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class UtilityTools extends StatelessWidget {
  const UtilityTools({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'icon': Icons.list_alt_rounded, 'label': 'Directory'},
      {'icon': Icons.currency_exchange_rounded, 'label': 'Currency Convert'},
      {'icon': Icons.straighten_rounded, 'label': 'Unit Converter'},
      {'icon': Icons.map_rounded, 'label': 'Map'},
      {'icon': Icons.description_rounded, 'label': 'Shipping Terms'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section (Quick Links style)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            child: Row(
              children: [
                const Text(
                  ' Utility Tools ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 20,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Tools Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1.0,
            ),
            itemCount: tools.length,
            itemBuilder: (context, index) {
              final tool = tools[index];
              return _UtilityToolCard(
                icon: tool['icon'] as IconData,
                label: tool['label'] as String,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UtilityToolCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _UtilityToolCard({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to utility tool
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.borderColor,
              width: 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.primary,
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: 10,
                  color: Colors.black,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
