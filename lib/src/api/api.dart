class Api {
  Api._();
  static const String baseUrl = "http://10.0.2.2:5000";
  static const String signUp = "$baseUrl/users/signup";
  static const String login = "$baseUrl/users/signin";
  static const String logout = "$baseUrl/users/logout";
  static const String getImage = "$baseUrl/upload/images";
  static const String getAllUsers = "$baseUrl/users/all-users";
  //http://localhost:5000/messages/get-messages
  //messages
  static String getMessageBetweenTwoUsers(String senderId, String receiverId) =>
      "$baseUrl/messages/get-messages?senderId=$senderId&receiverId=$receiverId";
}
