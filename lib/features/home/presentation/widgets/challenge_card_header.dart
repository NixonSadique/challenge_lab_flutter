import 'package:flutter/material.dart';

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
        return const Color(0xffE6F4EA);
      case 'intermediate':
        return const Color(0xffE8F0FE);
      case 'advanced':
        return const Color(0xffFCE8E6);
      default:
        return const Color(0xffE1E3E4);
    }
  }

  Color _getDifficultyTextColor(){
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return const Color(0xff137333);
      case 'intermediate':
        return const Color(0xff1967D2);
      case 'advanced':
        return const Color(0xffC5221F);
      default:
        return const Color(0xff000000);
    }
  }

  Color _getDifficultyBorderColor() {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return const Color(0xffCEEAD6);
      case 'intermediate':
        return const Color(0xffD2E3FC);
      case 'advanced':
        return const Color(0xffFAD2CF);
      default:
        return const Color(0xffd1d1d1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xffE7E8E9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                category,
                style: const TextStyle(color: Color(0xff5D5E61), fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: _getDifficultyColor(),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _getDifficultyBorderColor(),
                  width: 2,
                ),
              ),
              child: Text(
                difficulty,
                style: TextStyle(color: _getDifficultyTextColor(), fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const Icon(Icons.bookmark_outline_rounded),
      ],
    );
  }
}
