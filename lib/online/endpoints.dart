class Endpoints {
  Endpoints._();

  // static const String host = "http://localhost:8080";
  // static const String host = "http://192.168.1.4:8080";

  static const String _http = "http://";
  static String host = _http + "192.168.236.83:8080";
  // static const String host = "http://192.168.214.83:8080";

  static const String apiV1 = "/api/v1";
  static String baseUrl = host + apiV1;

  static const String register = "/register";
  static const String login = "/login";
  // static const String logout = "/api/v1/logout";
}
