class ErrorResp {
  String msg;
  dynamic err;
  Map<String, dynamic>? details;

  ErrorResp({required this.msg, required this.err, required this.details});

  factory ErrorResp.fromJson(Map<String, dynamic> json) {
    return ErrorResp(
      msg: json['msg'],
      err: json['err'],
      details: json['details'],
    );
  }
}
