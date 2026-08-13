class LoginRequest {
  final String identifier;
  final String password;

  LoginRequest({required this.identifier, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String? avatarUrl;
  final String? bio;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatarUrl,
    this.bio,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "avatarUrl": avatarUrl,
      "bio": bio,
    };
  }
}

class TokenResponse {
  final int userId;
  final String username;
  final String accessToken;
  final String refreshToken;

  TokenResponse({
    required this.userId,
    required this.username,
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      userId: json['userId'],
      username: json['username'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
