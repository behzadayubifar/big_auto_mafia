import '../../../../offline/db/entities/situation.dart';

class SituationsResp {
  String? msg;
  Situation? situation;

  SituationsResp({
    this.msg,
    this.situation,
  });

  factory SituationsResp.empty() {
    return SituationsResp();
  }

  factory SituationsResp.fromJson(Map<String, dynamic> json) {
    return SituationsResp(
      msg: json['msg'] ?? '',
      situation: json['situation'] != null
          ? Situation.fromJson(json['situation'])
          : null,
    );
  }
}
