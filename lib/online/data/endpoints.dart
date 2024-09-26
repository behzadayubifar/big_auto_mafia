// TODO: MAKE ALL NEEDED CHANGES TO BE LIKE 'START GAME' ENDPOINT
class Endpoints {
  Endpoints._();

  // static const String host = "http://localhost:8080";
  // static const String host = "http://192.168.1.4:8080";
  // static const String host = "http://192.168.214.83:8080";

  static const String http = "http://";
  static String host = "192.168.1.2";
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
  static const String createRoom = "/rooms/"; // post
  static const String getRooms = "/rooms"; // get
  static const String getRoom = "/rooms/"; // get
  static const String manageRoom = "/rooms/"; // post
  static const String partiallyUpdateRoom = "/rooms/"; // patch
  static const String joinRoom = "/rooms/"; // post
  static const String leaveRoom = "/rooms/"; // post
  static const String updateRoomStatus = "/rooms/"; // patch

  // -- Events
  static const String events = "/events/"; // get

  // -- Game

  // /{room_id}/confirm_readiness
  static String rediness(
    String roomId,
  ) =>
      "/situations/$roomId/confirm_readiness"; // post

  // /players/{room_id}/
  static String getPlayerById(
    String roomId,
  ) =>
      "/players/$roomId"; // get

  // /situations/{room_id}
  static String getGameSituation(String roomId) => "/situations/$roomId"; // get

  // Votes --------------------------------

  // http://localhost:8080/api/v1/votes/?level=1
  /* 
    {
  "room_id": "55647ae6-224f-49bc-af48-c6fe9d08d1bb",
  "day_num": 1,
  "voted": "3667cd55-29e5-42d8-9976-8176bf5142ba"
}
   */
  static String vote(int level) => "/votes/?level=$level"; // post

  /* 
  http://localhost:8080/api/v1/votes/55647ae6-224f-49bc-af48-c6fe9d08d1bb/1?level=2
   */
  static String getVotes(String roomId, int dayNum, int level) =>
      "/votes/$roomId/$dayNum?level=$level"; // get
}
