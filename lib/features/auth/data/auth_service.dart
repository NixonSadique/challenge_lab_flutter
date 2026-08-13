import 'dart:convert';

import 'package:challenge_lab_flutter/core/constants/app_constants.dart';
import 'package:challenge_lab_flutter/core/network/api_client.dart';

class AuthService {
  final _client = ApiClient();

  Future<void> login(String identifier, String password) async {
    var response = await _client.post(AppConstants.loginEndpoint, {
      'identifier': identifier,
      'password': password,
    });

    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _client.saveTokens(body['accessToken'], body['refreshToken']);
      return;
    }

    if (body.containsKey("fields")) {
      final fields = body["fields"] as List;

      final message = fields
          .map((e) => "${e["field"]}: ${e["message"]}")
          .join("\n");

      throw Exception(message);
    }

    throw Exception(body["title"]);
  }

  Future<void> logout() async {
    await _client.post(AppConstants.logoutEndpoint, null);
    _client.clearTokens();
  }

  Future<Map<String, dynamic>> register(
    Map<String, dynamic> request,
    String role,
  ) async {
    var requestBody = {
      "username": request['username'],
      "password": request['password'],
      "email": request['email'],
      "firstName": request['firstName'],
      "lastName": request['lastName'],
      "avatarUrl": request['avatarUrl'],
      "bio": request['bio'],
    };
    var response = await _client.post(
      "${AppConstants.registerEndpoint}?role=${role.toUpperCase()}",
      requestBody,
    );

      var responseBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      _client.saveTokens(
        responseBody['accessToken'],
        responseBody['refreshToken'],
      );
      return {
        "userId": responseBody['userId'],
        "username": responseBody['username'],
      };
    } else {
      if (responseBody.containsKey("fields")) {
        final fields = responseBody["fields"] as List;

        final message = fields
            .map((e) => "${e["field"]}: ${e["message"]}")
            .join("\n");

        throw Exception(message);
      }

      throw Exception(responseBody["title"]);
    }
  }

  Future<void> refresh() async {
    var response = await _client.post(AppConstants.refreshEndpoint, {
      'refreshToken': await _client.getRefreshToken(),
    });

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      _client.saveTokens(body['accessToken'], body['refreshToken']);
      return;
    } else {
      var error = jsonDecode(response.body);
      throw Exception('${error["message"]}');
    }
  }
}
