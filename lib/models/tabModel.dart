// To parse this JSON data, do
//
//     final tabModel = tabModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

TabModel tabModelFromJson(String str) => TabModel.fromJson(json.decode(str));

String tabModelToJson(TabModel data) => json.encode(data.toJson());

class TabModel {
  TabModel({
    required this.name,
    required this.screen,
  });

  String name;
  Widget screen;

  factory TabModel.fromJson(Map<String, dynamic> json) => TabModel(
        name: json["name"],
        screen: json["screen"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "screen": screen,
      };
}
