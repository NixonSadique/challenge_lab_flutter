import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_card_surface.dart';

class StatCard extends StatelessWidget {
  final String text;
  final String amount;
  final IconData icon;
  final Color? amountColor;

  const StatCard({
    super.key,
    required this.text,
    required this.amount,
    required this.icon,
    this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: AppCardSurface(
        showBorder: false,
        showShadow: true,
        radius: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: AppColors.secondary),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: AppColors.secondary),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: amountColor ?? AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
