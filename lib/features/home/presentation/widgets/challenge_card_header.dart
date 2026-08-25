import 'package:challenge_lab_flutter/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_status_chip.dart';

class ChallengeCardHeader extends StatelessWidget {
  final String category;
  final String difficulty;

  const ChallengeCardHeader({
    super.key,
    required this.category,
    required this.difficulty,
  });

  Color _getDifficultyColor() {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return AppColors.difficultyBeginnerBg;
      case 'intermediate':
        return AppColors.difficultyIntermediateBg;
      case 'advanced':
        return AppColors.difficultyAdvancedBg;
      default:
        return AppColors.surfaceVariant;
    }
  }

  Color _getDifficultyTextColor() {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return AppColors.difficultyBeginnerFg;
      case 'intermediate':
        return AppColors.difficultyIntermediateFg;
      case 'advanced':
        return AppColors.difficultyAdvancedFg;
      default:
        return AppColors.onSurface;
    }
  }

  Color _getDifficultyBorderColor() {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return AppColors.difficultyBeginnerBorder;
      case 'intermediate':
        return AppColors.difficultyIntermediateBorder;
      case 'advanced':
        return AppColors.difficultyAdvancedBorder;
      default:
        return AppColors.surfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppStatusChip(
              label: category,
              backgroundColor: AppColors.surfaceContainerHigh,
              foregroundColor: AppColors.secondary,
            ),
            const SizedBox(width: 8),
            AppStatusChip(
              label: difficulty,
              backgroundColor: _getDifficultyColor(),
              foregroundColor: _getDifficultyTextColor(),
              borderColor: _getDifficultyBorderColor(),
              bold: true,
            ),
          ],
        ),
        const Icon(Icons.bookmark_outline_rounded),
      ],
    );
  }
}
