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
  double wallet;
  dynamic deviceId;
  int isEmailVerified;
  int code;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  MyPlan? myPlan;
  List<BillingInformation>? billingInformation;
  MyNumber? myNumber;
  int? pendingMessages;
  int? messageCredit;
  List<Plan>? plans;

  User({
    required this.id,
    required this.email,
    required this.gender,
    required this.firstName,
    required this.lastName,
    this.city,
    this.street,
    this.zipcode,
    this.country,
    this.state,
    this.phone,
    required this.wallet,
    required this.deviceId,
    required this.isEmailVerified,
    required this.code,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.myPlan,
    this.billingInformation,
    this.myNumber,
    this.messageCredit,
    this.pendingMessages,
    this.plans,
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
        myPlan:
            json["my_plan"] != null ? MyPlan.fromJson(json["my_plan"]) : null,
        billingInformation: json["billing_information"] != null
            ? List<BillingInformation>.from(json["billing_information"]
                .map((x) => BillingInformation.fromJson(x)))
            : null,
        myNumber: json["my_number"] != null
            ? MyNumber.fromJson(json["my_number"])
            : null,
        pendingMessages: json["pending_messages"],
        messageCredit: json['message_credit'],
        plans: json["plans"] != null
            ? List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x)))
            : null,
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
        "my_plan": myPlan?.toJson(),
        "billing_information": billingInformation != null
            ? List<dynamic>.from(billingInformation!.map((x) => x.toJson()))
            : null,
        "my_number": myNumber?.toJson(),
        "pending_messages": pendingMessages,
        "message_credit": messageCredit,
        "plans": plans != null
            ? List<dynamic>.from(plans!.map((x) => x.toJson()))
            : null,
      };
}

class BillingInformation {
  String firstName;
  String lastName;
  String? city;
  String? street;
  String? zipcode;
  String? country;
  String? state;
  String? phone;

  BillingInformation({
    required this.firstName,
    required this.lastName,
    this.city,
    this.street,
    this.zipcode,
    this.country,
    this.state,
    this.phone,
  });

  factory BillingInformation.fromJson(Map<String, dynamic> json) =>
      BillingInformation(
        firstName: json["first_name"],
        lastName: json["last_name"],
        city: json["city"],
        street: json["street"],
        zipcode: json["zipcode"],
        country: json["country"],
        state: json["state"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "city": city,
        "street": street,
        "zipcode": zipcode,
        "country": country,
        "state": state,
        "phone": phone,
      };
}

class MyNumber {
  String? phoneNo;
  int? status;

  MyNumber({
    this.phoneNo,
    this.status,
  });

  factory MyNumber.fromJson(Map<String, dynamic> json) => MyNumber(
        phoneNo: json["phone_no"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "status": status,
      };
}

class MyPlan {
  int? id;
  int? userId;
  int? planId;
  int? amount;
  int? status;

  MyPlan({
    this.id,
    this.userId,
    this.planId,
    this.amount,
    this.status,
  });

  factory MyPlan.fromJson(Map<String, dynamic> json) => MyPlan(
        id: json["id"],
        userId: json["user_id"],
        planId: json["plan_id"],
        amount: json["amount"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "plan_id": planId,
        "amount": amount,
        "status": status,
      };
}

class Plan {
  int? id;
  String? title;
  int? amount;
  int? period;

  Plan({
    this.id,
    this.title,
    this.amount,
    this.period,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        period: json["period"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "amount": amount,
        "period": period,
      };
}
