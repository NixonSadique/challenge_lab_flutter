import 'package:challenge_lab_flutter/features/home/data/home_service.dart';
import 'package:challenge_lab_flutter/features/home/data/models/challenge_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/user_model.dart';
import 'package:challenge_lab_flutter/features/home/presentation/screens/admin_home_screen.dart';
import 'package:challenge_lab_flutter/features/home/presentation/screens/user_home_screen.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_card_surface.dart';
import 'package:challenge_lab_flutter/shared/widgets/app_section_title.dart';
import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeService = HomeService();
  final _filters = [];
  int _selectedTab = 0;

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

  bool get _isAdmin => _user?.role.toUpperCase() == 'ADMIN';

  Widget _buildPlaceholder({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionTitle(title),
          const SizedBox(height: 16),
          AppCardSurface(
            showShadow: true,
            showBorder: false,
            child: Row(
              children: [
                Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_selectedTab == 0) {
      return _isAdmin
          ? const AdminHomeScreen()
          : UserHomeScreen(
              challenges: _challenges,
              isLoading: _isLoading,
              errorMessage: _errorMessage,
              fetchData: _fetchData,
              filters: _filters,
            );
    }
    if (_selectedTab == 1) {
      return _buildPlaceholder(
        icon: Icons.groups_rounded,
        title: "Teams",
        description: "Team management will be added in the next implementation steps.",
      );
    }
    return _buildPlaceholder(
      icon: Icons.person_rounded,
      title: "Profile",
      description: "Profile screens will be added in the next implementation steps.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _selectedTab,
        onTap: (index) => setState(() => _selectedTab = index),
      ),
      appBar: HomeAppBar(username: _user?.username ?? 'User'),
      body: _buildBody(),
    );
  }
}
