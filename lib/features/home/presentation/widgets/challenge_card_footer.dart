import 'package:challenge_lab_flutter/features/home/presentation/widgets/text_icon.dart';
import 'package:flutter/material.dart';

class ChallengeCardFooter extends StatelessWidget {
  final String timeLeft;
  final int maxParticipants;
  final VoidCallback onTapDetails;

  const ChallengeCardFooter({
    super.key,
    required this.timeLeft,
    required this.maxParticipants,
    required this.onTapDetails,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextIcon(icon: Icons.timer_outlined, text: timeLeft),
            const SizedBox(width: 8),
            TextIcon(
              icon: Icons.people_alt_outlined,
              text: maxParticipants > 99 ? "99+" : "Max $maxParticipants",
            ),
          ],
        ),
        GestureDetector(
          onTap: onTapDetails,
          child: Row(
            children: [
              Text(
                "View Details",
                style: textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
