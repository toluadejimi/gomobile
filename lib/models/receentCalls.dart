// To parse this JSON data, do
//
//     final recentCalls = recentCallsFromJson(jsonString);

import 'dart:convert';

RecentCalls recentCallsFromJson(String str) =>
    RecentCalls.fromJson(json.decode(str));

String recentCallsToJson(RecentCalls data) => json.encode(data.toJson());

class RecentCalls {
  String? toPhone;
  String? name;
  DateTime createdAt;

  RecentCalls({
    this.toPhone,
    this.name,
    required this.createdAt,
  });

  factory RecentCalls.fromJson(Map<String, dynamic> json) => RecentCalls(
        toPhone: json["to_phone"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "to_phone": toPhone,
        "name": name,
        "created_at": createdAt.toIso8601String(),
      };
}
