import 'package:challenge_lab_flutter/features/home/data/home_service.dart';
import 'package:challenge_lab_flutter/features/home/data/models/challenge_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/user_model.dart';
import 'package:challenge_lab_flutter/features/home/presentation/screens/admin_home_screen.dart';
import 'package:challenge_lab_flutter/features/home/presentation/screens/user_home_screen.dart';
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
      body: AdminHomeScreen(),
    );
  }
}
