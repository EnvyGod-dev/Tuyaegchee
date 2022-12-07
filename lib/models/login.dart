class LoginResponse {
  String? status;
  String? message;
  String? token;
  String? role;

  LoginResponse({this.status, this.message, this.role, this.token});

  LoginResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    token = json["token"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["token"] = token;
    map["role"] = role;

    return map;
  }
}
