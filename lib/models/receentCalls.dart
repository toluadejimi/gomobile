// To parse this JSON data, do
//
//     final recentCalls = recentCallsFromJson(jsonString);

import 'dart:convert';

RecentCalls recentCallsFromJson(String str) =>
    RecentCalls.fromJson(json.decode(str));

String recentCallsToJson(RecentCalls data) => json.encode(data.toJson());

class RecentCalls {
  String toPhone;
  String? name;
  String callUrl;
  DateTime createdAt;

  RecentCalls({
    required this.toPhone,
    required this.name,
    required this.callUrl,
    required this.createdAt,
  });

  factory RecentCalls.fromJson(Map<String, dynamic> json) => RecentCalls(
        toPhone: json["to_phone"],
        name: json["name"],
        callUrl: json["call_url"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "to_phone": toPhone,
        "name": name,
        "call_url": callUrl,
        "created_at": createdAt.toIso8601String(),
      };
}
