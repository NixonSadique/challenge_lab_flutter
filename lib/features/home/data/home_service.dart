import 'dart:convert';
import 'package:challenge_lab_flutter/core/constants/app_constants.dart';
import 'package:challenge_lab_flutter/core/network/api_client.dart';
import 'package:challenge_lab_flutter/features/home/data/models/challenge_model.dart';
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
}
