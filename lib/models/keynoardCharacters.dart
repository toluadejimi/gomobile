// To parse this JSON data, do
//
//     final keyboardCharacters = keyboardCharactersFromJson(jsonString);

import 'dart:convert';

KeyboardCharacters keyboardCharactersFromJson(String str) =>
    KeyboardCharacters.fromJson(json.decode(str));

String keyboardCharactersToJson(KeyboardCharacters data) =>
    json.encode(data.toJson());

class KeyboardCharacters {
  String value;
  String id;

  KeyboardCharacters({
    required this.value,
    required this.id,
  });

  factory KeyboardCharacters.fromJson(Map<String, dynamic> json) =>
      KeyboardCharacters(
        value: json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "id": id,
      };
}
