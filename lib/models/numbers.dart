// To parse this JSON data, do
//
//     final number = numberFromJson(jsonString);

import 'dart:convert';

Number numberFromJson(String str) => Number.fromJson(json.decode(str));

String numberToJson(Number data) => json.encode(data.toJson());

class Number {
  List<String> phoneNumbers;
  int amount;

  Number({
    required this.phoneNumbers,
    required this.amount,
  });

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        phoneNumbers: List<String>.from(json["phone_numbers"].map((x) => x)),
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "phone_numbers": List<dynamic>.from(phoneNumbers.map((x) => x)),
        "amount": amount,
      };
}
