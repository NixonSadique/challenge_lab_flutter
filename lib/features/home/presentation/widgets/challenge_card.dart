import 'package:flutter/material.dart';
import 'challenge_card_header.dart';
import 'challenge_card_body.dart';
import 'challenge_card_footer.dart';

class ChallengeCard extends StatelessWidget {
  final String category;
  final String difficulty;
  final String title;
  final String description;
  final String timeLeft;
  final int maxParticipants;
  final VoidCallback onTapDetails;

  const ChallengeCard({
    super.key,
    required this.category,
    required this.difficulty,
    required this.title,
    required this.description,
    required this.timeLeft,
    required this.maxParticipants,
    required this.onTapDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ChallengeCardHeader(
            category: category,
            difficulty: difficulty,
          ),
          ChallengeCardBody(
            title: title,
            description: description,
          ),
          ChallengeCardFooter(
            timeLeft: timeLeft,
            maxParticipants: maxParticipants,
            onTapDetails: onTapDetails,
          ),
        ],
      ),
    );
  }
}
