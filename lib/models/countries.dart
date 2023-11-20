// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  String? code;
  String? name;
  String? flag;

  Countries({
    required this.code,
    required this.name,
    required this.flag,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        code: json["code"],
        name: json["name"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "flag": flag,
      };
}
