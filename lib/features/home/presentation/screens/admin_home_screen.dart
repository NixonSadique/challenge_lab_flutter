import 'package:challenge_lab_flutter/features/home/data/home_service.dart';
import 'package:challenge_lab_flutter/features/home/data/models/stats_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/user_model.dart';
import 'package:challenge_lab_flutter/features/home/presentation/widgets/admin/admin_action_area.dart';
import 'package:challenge_lab_flutter/features/home/presentation/widgets/admin/user_management_table.dart';
import 'package:challenge_lab_flutter/features/home/presentation/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final _homeService = HomeService();
  bool _isLoading = true;
  String? _errorMessage;

  StatsModel? _stats;
  List<UserModel> _users = [];

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
      final stats = await _homeService.getAdminStats();
      final users = await _homeService.getAdminUsers();
      if (mounted) {
        setState(() {
          _stats = stats;
          _users = users;
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

  Future<void> _handleBulkClose() async {
    try {
      await _homeService.bulkCloseExpiredChallenges();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Successfully closed expired challenges")),
      );
      _fetchData(); // Refresh stats
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
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
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191C1D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          StatCard(
                            amount: _stats?.totalUsers.toString() ?? '0',
                            text: "Total Users",
                            icon: Icons.person_rounded,
                          ),
                          StatCard(
                            amount: _stats?.totalChallenges.toString() ?? '0',
                            text: "Challenges",
                            icon: Icons.workspace_premium_rounded,
                          ),
                          StatCard(
                            amount: _stats?.activeChallenges.toString() ?? '0',
                            text: "Active",
                            icon: Icons.bolt_rounded,
                            amountColor: const Color(0xff634800),
                          ),
                          StatCard(
                            amount: _stats?.totalSubmissions.toString() ?? '0',
                            text: "Submissions",
                            icon: Icons.send_rounded,
                          ),
                          StatCard(
                            amount: _stats?.totalRatings.toString() ?? '0',
                            text: "Ratings",
                            icon: Icons.star_rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    UserManagementTable(users: _users),
                    const SizedBox(height: 40),
                    AdminActionArea(onBulkClose: _handleBulkClose),
                    const SizedBox(height: 80), // Space for bottom nav
                  ],
                ),
    );
  }
}
