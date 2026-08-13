import 'package:flutter/material.dart';

import '../widgets/challenge_card.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/home_filter_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final values = ["Difficulty", "Category", "Max Allowed"];

  final mockDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
      "nisi ut aliquip ex ea commodo consequat. "
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum "
      "dolore eu fugiat nulla pariatur. "
      "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui "
      "officia deserunt mollit anim id est laborum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavBar(),
      appBar: const HomeAppBar(username: 'nixon'),
      body: ListView(
        children: [
          const SizedBox(height: 32),
          HomeFilterSection(filters: values, onFilterPressed: () {}),
          const SizedBox(height: 16),
          ChallengeCard(
            difficulty: "Beginner",
            category: "Data Science",
            title: "Optimize Urban Delivery Routes with AI",
            description: mockDescription,
            timeLeft: '5 Days left',
            maxParticipants: 5,
            onTapDetails: () {},
          ),
          ChallengeCard(
            difficulty: "Intermediate",
            category: "Data Science",
            title: "Optimize Urban Delivery Routes with AI",
            description: mockDescription,
            timeLeft: '5 Days left',
            maxParticipants: 5,
            onTapDetails: () {},
          ),
          ChallengeCard(
            difficulty: "Advanced",
            category: "Data Science",
            title: "Optimize Urban Delivery Routes with AI",
            description: mockDescription,
            timeLeft: '5 Days left',
            maxParticipants: 5,
            onTapDetails: () {},
          ),
        ],
      ),
    );
  }
}
