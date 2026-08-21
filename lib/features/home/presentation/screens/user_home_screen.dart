import 'package:flutter/material.dart';

import '../../data/models/challenge_model.dart';
import '../widgets/challenge_card.dart';
import '../widgets/home_filter_section.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({
    super.key,
    this.errorMessage,
    required this.isLoading,
    required this.fetchData,
    required this.challenges,
    required this.filters,
  });

  final List filters;

  final List<ChallengeModel> challenges;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback fetchData;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : errorMessage != null
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorMessage!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: fetchData,
                  child: const Text("Retry"),
                ),
              ],
            ),
          )
        : ListView(
            children: [
              const SizedBox(height: 32),
              HomeFilterSection(filters: filters, onFilterPressed: () {}),
              const SizedBox(height: 16),
              if (challenges.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text("No challenges found."),
                  ),
                ),
              ...challenges.map((challenge) {
                // Calculate days left
                final daysLeft = challenge.deadline
                    .difference(DateTime.now())
                    .inDays;
                final timeLeft = daysLeft > 0
                    ? '$daysLeft days left'
                    : 'Expired';

                return ChallengeCard(
                  difficulty: challenge.difficulty,
                  category: challenge.category,
                  title: challenge.title,
                  description: challenge.description,
                  timeLeft: timeLeft,
                  maxParticipants: challenge.maxTeamSize,
                  onTapDetails: () {
                    // TODO: Navigate to details
                  },
                );
              }),
            ],
          );
  }
}
