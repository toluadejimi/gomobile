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
  String? callUrl;
  String? callTime;
  DateTime createdAt;

  RecentCalls(
      {required this.toPhone,
      this.name,
      this.callUrl,
      required this.createdAt,
      this.callTime});

  factory RecentCalls.fromJson(Map<String, dynamic> json) => RecentCalls(
        toPhone: json["to_phone"],
        name: json["name"],
        callUrl: json["call_url"],
        createdAt: DateTime.parse(json["created_at"]),
        callTime: json["call_time"],
      );

  Map<String, dynamic> toJson() => {
        "to_phone": toPhone,
        "name": name,
        "call_url": callUrl,
        "call_time": callTime,
        "created_at": createdAt.toIso8601String(),
      };
}
