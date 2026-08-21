import 'dart:convert';
import 'package:challenge_lab_flutter/core/constants/app_constants.dart';
import 'package:challenge_lab_flutter/core/network/api_client.dart';
import 'package:challenge_lab_flutter/features/home/data/models/challenge_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/stats_model.dart';
import 'package:challenge_lab_flutter/features/home/data/models/user_model.dart';

class HomeService {
  final _client = ApiClient();

  Future<UserModel> getMe() async {
    final response = await _client.get(AppConstants.meEndpoint);
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(body);
    }

    throw Exception(body["title"] ?? "Failed to fetch profile");
  }

  Future<ChallengeListResponse> getChallenges({
    String? difficulty,
    int page = 0,
    int size = 10,
  }) async {
    String query = "?page=$page&size=$size";
    if (difficulty != null) {
      query += "&difficulty=${difficulty.toUpperCase()}";
    }

    final response = await _client.get(
      "${AppConstants.challengesEndpoint}$query",
    );
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ChallengeListResponse.fromJson(body);
    }

    throw Exception(body["title"] ?? "Failed to fetch challenges");
  }

  Future<StatsModel> getAdminStats() async {
    final response = await _client.get(AppConstants.adminStatsEndpoint);
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return StatsModel.fromJson(body);
    }

    throw Exception(body["title"] ?? "Failed to fetch admin stats");
  }

  Future<List<UserModel>> getAdminUsers({int page = 0, int size = 10}) async {
    final response = await _client.get(
      "${AppConstants.adminUsersEndpoint}?page=$page&size=$size",
    );
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (body['content'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }

    throw Exception(body["title"] ?? "Failed to fetch users");
  }

  Future<void> bulkCloseExpiredChallenges() async {
    final response = await _client.patch(
      AppConstants.adminChallengesEndpoint + "/close-expired",
      null,
    );
    if (response.statusCode != 200) {
      final body = jsonDecode(response.body);
      throw Exception(body["title"] ?? "Failed to close challenges");
    }
  }
}
