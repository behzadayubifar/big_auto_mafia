class Endpoints {
  Endpoints._();

  // static const String host = "http://localhost:8080";
  // static const String host = "http://192.168.1.4:8080";
  // static const String host = "http://192.168.236.83:8080";
  static const String host = "http://192.168.214.83:8080";

  static const String baseUrl = "/api/v1";

  static const String register = host + baseUrl + "/register";
  static const String login = host + baseUrl + "/login";
  // static const String logout = "/api/v1/logout";
}
