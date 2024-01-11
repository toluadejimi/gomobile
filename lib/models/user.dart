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
  double smsCredit;
  double wallet;
  dynamic deviceId;
  int isEmailVerified;  //1 or 0
  int code;
  int status; //1 or 0
  DateTime createdAt;
  DateTime updatedAt;
  MyPlan? myPlan;
  List<BillingInformation>? billingInformation;
  MyNumber? myNumber;
  int? pendingMessages;
  List<Plan>? plans;
  String? pin;

  User(
      {required this.id,
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
      required this.smsCredit,
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
      this.pendingMessages,
      this.plans,
      this.pin});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      gender: json["gender"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      city: json["city"],
      smsCredit: double.parse(json["sms_credit"].toString()),
      street: json["street"],
      zipcode: json["zipcode"],
      country: json["country"],
      state: json["state"],
      phone: json["phone"],
      wallet: double.parse(json["wallet"].toString()),
      deviceId: json["device_id"],
      isEmailVerified: json["is_email_verified"],
      code: json["code"],
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      myPlan: json["my_plan"] != null ? MyPlan.fromJson(json["my_plan"]) : null,
      billingInformation: json["billing_information"] != null
          ? List<BillingInformation>.from(json["billing_information"]
              .map((x) => BillingInformation.fromJson(x)))
          : null,
      myNumber: json["my_number"] != null
          ? MyNumber.fromJson(json["my_number"])
          : null,
      pendingMessages: json["pending_messages"],
      plans: json["plans"] != null
          ? List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x)))
          : null,
      pin: json['pin']);

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
        "sms_credit": smsCredit,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "my_plan": myPlan?.toJson(),
        "billing_information": billingInformation != null
            ? List<dynamic>.from(billingInformation!.map((x) => x.toJson()))
            : null,
        "my_number": myNumber?.toJson(),
        "pending_messages": pendingMessages,
        "plans": plans != null
            ? List<dynamic>.from(plans!.map((x) => x.toJson()))
            : null,
        'pin': pin
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
  int? planId;
  int? daysRemaining; // cannot be null
  String? expiresAt;
  int? amount;
  int? status;

  MyPlan({
    this.id,
    this.planId,
    this.daysRemaining,
    this.expiresAt,
    this.amount,
    this.status,
  });

  factory MyPlan.fromJson(Map<String, dynamic> json) => MyPlan(
        id: json["id"],
        planId: json["plan_id"],
        amount: json["amount"],
        status: json["status"],
        daysRemaining: json["days_remaining"],
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "amount": amount,
        "status": status,
        "days_remaining": daysRemaining,
        "expires_at": expiresAt
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
