// To parse this JSON data, do
//
//     final savedCards = savedCardsFromJson(jsonString);

import 'dart:convert';

SavedCards savedCardsFromJson(String str) => SavedCards.fromJson(json.decode(str));

String savedCardsToJson(SavedCards data) => json.encode(data.toJson());

class SavedCards {
    bool status;
    Data data;

    SavedCards({
        required this.status,
        required this.data,
    });

    factory SavedCards.fromJson(Map<String, dynamic> json) => SavedCards(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    List<Info> info;

    Data({
        required this.info,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
    };
}

class Info {
    int id;
    String customerId;
    String name;

    Info({
        required this.id,
        required this.customerId,
        required this.name,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
    };
}
