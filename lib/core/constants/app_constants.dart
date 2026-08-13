
class AppConstants {
  AppConstants._();

  //Basic request needs
  static const String baseUrl = "http://127.0.0.1:8080/api/v1";
  static const accessTokenName = "accessToken";
  static const refreshTokenName = "refreshToken";

  // #Endpoints
    //Auth Endpoints
  static const loginEndpoint = 'auth/login';
  static const logoutEndpoint = 'auth/logout';
  static const refreshEndpoint = 'auth/refresh';
  static const registerEndpoint = 'auth/register';
}