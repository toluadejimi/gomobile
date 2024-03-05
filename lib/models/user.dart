// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String email;
  String gender;
  String firstName;
  String lastName;
  String? city;
  String? street;
  String? zipcode;
  String? country;
  String? state;
  String? phone;
  int wallet;
  String? deviceId;
  int isEmailVerified;
  int code;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.street,
    required this.zipcode,
    required this.country,
    required this.state,
    required this.phone,
    required this.wallet,
    required this.deviceId,
    required this.isEmailVerified,
    required this.code,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        gender: json["gender"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        city: json["city"],
        street: json["street"],
        zipcode: json["zipcode"],
        country: json["country"],
        state: json["state"],
        phone: json["phone"],
        wallet: json["wallet"],
        deviceId: json["device_id"],
        isEmailVerified: json["is_email_verified"],
        code: json["code"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "gender": gender,
        "first_name": firstName,
        "last_name": lastName,
        "city": city,
        "street": street,
        "zipcode": zipcode,
        "country": country,
        "state": state,
        "phone": phone,
        "wallet": wallet,
        "device_id": deviceId,
        "is_email_verified": isEmailVerified,
        "code": code,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
