// To parse this JSON data, do
//
//     final savedCards = savedCardsFromJson(jsonString);

import 'dart:convert';

SavedCards savedCardsFromJson(String str) =>
    SavedCards.fromJson(json.decode(str));

String savedCardsToJson(SavedCards data) => json.encode(data.toJson());

class SavedCards {
  List<Info> info;

  SavedCards({
    required this.info,
  });

  factory SavedCards.fromJson(Map<String, dynamic> json) => SavedCards(
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class Info {
  int id;
  String customerId;
  String brand;
  String last4;
  String expMonth;
  String expYear;
  String name;

  Info({
    required this.id,
    required this.customerId,
    required this.brand,
    required this.last4,
    required this.expMonth,
    required this.expYear,
    required this.name,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        customerId: json["customer_id"],
        brand: json["brand"],
        last4: json["last4"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "brand": brand,
        "last4": last4,
        "exp_month": expMonth,
        "exp_year": expYear,
        "name": name,
      };
}
