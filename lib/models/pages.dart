// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Pages pageFromJson(String str) => Pages.fromJson(json.decode(str));

String pageToJson(Pages data) => json.encode(data.toJson());

class Pages {
  Pages({
    required this.icon,
    required this.index,
  });

  Widget icon;
  int index;

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
        icon: json["icon"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "index": index,
      };
}
