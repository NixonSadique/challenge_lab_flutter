import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_status_chip.dart';

class HomeFilterSection extends StatelessWidget {
  final List<dynamic> filters;
  final VoidCallback onFilterPressed;

  const HomeFilterSection({
    super.key,
    required this.filters,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: onFilterPressed,
          child: const Row(
            children: [Icon(Icons.tune_rounded), Text("Filters")],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, i) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  child: AppStatusChip(
                    label: "$i: ${filters[i]}",
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimaryContainer,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
