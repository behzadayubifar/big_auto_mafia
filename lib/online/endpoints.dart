class Endpoints {
  Endpoints._();

  static const String host = "localhost:8080";
  static const String baseUrl = "/api/v1";

  static const String register = host + baseUrl + "/register";
  static const String login = host + baseUrl + "/login";
  // static const String logout = "/api/v1/logout";
}
