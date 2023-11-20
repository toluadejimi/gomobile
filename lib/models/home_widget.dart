// To parse this JSON data, do
//
//     final homeWidget = homeWidgetFromJson(jsonString);

import 'dart:convert';

HomeWidget homeWidgetFromJson(String str) =>
    HomeWidget.fromJson(json.decode(str));

String homeWidgetToJson(HomeWidget data) => json.encode(data.toJson());

class HomeWidget {
  String picture;
  String title;
  String description;
  String click;

  HomeWidget({
    required this.picture,
    required this.title,
    required this.description,
    required this.click,
  });

  factory HomeWidget.fromJson(Map<String, dynamic> json) => HomeWidget(
        picture: json["picture"],
        title: json["title"],
        description: json["description"],
        click: json["click"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
        "title": title,
        "description": description,
        "click": click,
      };
}

