// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';

Pages pageFromJson(String str) => Pages.fromJson(json.decode(str));

String pageToJson(Pages data) => json.encode(data.toJson());

class Pages {
  Pages({
    required this.iconOn,
    required this.iconOff,
    required this.index,
  });

  String iconOn, iconOff;
  int index;

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
        iconOn: json["iconOn"],
        iconOff: json["iconOff"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "iconOn": iconOn,
        "iconOff": iconOff,
        "index": index,
      };
}
