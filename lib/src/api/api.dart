class Api {
  Api._();
  static const String baseUrl = "http://10.0.2.2:5000";
  static const String signUp = "$baseUrl/users/signup";
  static const String login = "$baseUrl/users/signin";
  static const String logout = "$baseUrl/users/logout";
}
