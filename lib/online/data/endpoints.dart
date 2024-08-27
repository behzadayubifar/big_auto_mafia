class Endpoints {
  Endpoints._();

  // static const String host = "http://localhost:8080";
  // static const String host = "http://192.168.1.4:8080";
  // static const String host = "http://192.168.214.83:8080";

  static const String http = "http://";
  static String host = "192.168.236.83";
  static const String port = ":8080";
  static const String apiV1 = "/api/v1";

  // -- Users
  static const String register = "/register"; // post
  static const String login = "/login"; // post
  static const String getUsers = "/users"; // get
  static const String getUser = "/users/"; // get
  static const String updateUser = "/users/"; // put
  static const String deleteUser = "/users/"; // delete
  static const String partiallyUpdateUser = "/users/"; // patch

  // -- Rooms
  static const String createRoom = "/rooms"; // post
  static const String getRooms = "/rooms"; // get
  static const String getRoom = "/rooms/"; // get
  static const String manageRoom = "/rooms/"; // post
  static const String partiallyUpdateRoom = "/rooms/"; // patch
  static const String joinRoom = "/rooms/"; // post
  static const String leaveRoom = "/rooms/"; // post
  static const String updateRoomStatus = "/rooms/"; // patch
}
