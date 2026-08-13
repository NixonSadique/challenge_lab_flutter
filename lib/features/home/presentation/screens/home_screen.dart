import 'package:challenge_lab_flutter/features/home/data/home_service.dart';
import 'package:challenge_lab_flutter/features/home/data/models/challenge_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/user_model.dart';
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
  final _homeService = HomeService();
  final _filters = [];

  UserModel? _user;
  List<ChallengeModel> _challenges = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final user = await _homeService.getMe();
      final challengesRes = await _homeService.getChallenges();
      if (mounted) {
        setState(() {
          _user = user;
          _challenges = challengesRes.challenges;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceFirst("Exception: ", "");
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavBar(),
      appBar: HomeAppBar(username: _user?.username ?? 'User'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_errorMessage!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchData,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : ListView(
                  children: [
                    const SizedBox(height: 32),
                    HomeFilterSection(filters: _filters, onFilterPressed: () {}),
                    const SizedBox(height: 16),
                    if (_challenges.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text("No challenges found."),
                        ),
                      ),
                    ..._challenges.map((challenge) {
                      // Calculate days left
                      final daysLeft =
                          challenge.deadline.difference(DateTime.now()).inDays;
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
                ),
    );
  }
}
