import 'dart:convert';

class Userinfo {
  Userinfo({
    this.status,
    this.result,
  });

  String? status;
  Result? result;

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.age,
    this.phone,
    this.address,
    this.email,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? firstName;
  String? lastName;
  int? age;
  String? phone;
  String? address;
  String? email;
  String? role;
  dynamic? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "phone": phone,
        "address": address,
        "email": email,
        "role": role,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
