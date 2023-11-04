// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String role;
  int adsCredit;
  User user;
  DateTime created;
  String userModelClass;
  String primaryLocation;
  String brandColor;
  String ownerId;
  dynamic updated;
  String objectId;

  UserModel({
    required this.role,
    required this.adsCredit,
    required this.user,
    required this.created,
    required this.userModelClass,
    required this.primaryLocation,
    required this.brandColor,
    required this.ownerId,
    this.updated,
    required this.objectId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        role: json["role"],
        adsCredit: json["ads_credit"],
        user: User.fromJson(json["user"]),
        created: DateTime.parse(json["created"]),
        userModelClass: json["___class"],
        primaryLocation: json["primary_location"],
        brandColor: json["brand_color"],
        ownerId: json["ownerId"],
        updated: json["updated"],
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "ads_credit": adsCredit,
        "user": user.toJson(),
        "created": created.toIso8601String(),
        "___class": userModelClass,
        "primary_location": primaryLocation,
        "brand_color": brandColor,
        "ownerId": ownerId,
        "updated": updated,
        "objectId": objectId,
      };
}

class User {
  DateTime lastLogin;
  String userStatus;
  DateTime created;
  String accountType;
  String ownerId;
  String socialAccount;
  List<OAuthIdentity> oAuthIdentities;
  String name;
  String userClass;
  String blUserLocale;
  String id;
  DateTime updated;
  String email;
  String objectId;

  User({
    required this.lastLogin,
    required this.userStatus,
    required this.created,
    required this.accountType,
    required this.ownerId,
    required this.socialAccount,
    required this.oAuthIdentities,
    required this.name,
    required this.userClass,
    required this.blUserLocale,
    required this.id,
    required this.updated,
    required this.email,
    required this.objectId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        lastLogin: DateTime.parse(json["lastLogin"]),
        userStatus: json["userStatus"],
        created: DateTime.parse(json["created"]),
        accountType: json["accountType"],
        ownerId: json["ownerId"],
        socialAccount: json["socialAccount"],
        oAuthIdentities: List<OAuthIdentity>.from(
            json["oAuthIdentities"].map((x) => OAuthIdentity.fromJson(x))),
        name: json["name"],
        userClass: json["___class"],
        blUserLocale: json["blUserLocale"],
        id: json["id"],
        updated: DateTime.parse(json["updated"]),
        email: json["email"],
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "lastLogin": lastLogin.toIso8601String(),
        "userStatus": userStatus,
        "created": created.toIso8601String(),
        "accountType": accountType,
        "ownerId": ownerId,
        "socialAccount": socialAccount,
        "oAuthIdentities":
            List<dynamic>.from(oAuthIdentities.map((x) => x.toJson())),
        "name": name,
        "___class": userClass,
        "blUserLocale": blUserLocale,
        "id": id,
        "updated": updated.toIso8601String(),
        "email": email,
        "objectId": objectId,
      };
}

class OAuthIdentity {
  String providerCode;
  String displayName;
  String oAuthId;

  OAuthIdentity({
    required this.providerCode,
    required this.displayName,
    required this.oAuthId,
  });

  factory OAuthIdentity.fromJson(Map<String, dynamic> json) => OAuthIdentity(
        providerCode: json["providerCode"],
        displayName: json["displayName"],
        oAuthId: json["oAuthId"],
      );

  Map<String, dynamic> toJson() => {
        "providerCode": providerCode,
        "displayName": displayName,
        "oAuthId": oAuthId,
      };
}
