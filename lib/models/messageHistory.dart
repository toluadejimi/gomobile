// To parse this JSON data, do
//
//     final messageHistory = messageHistoryFromJson(jsonString);

import 'dart:convert';

MessageHistory messageHistoryFromJson(String str) =>
    MessageHistory.fromJson(json.decode(str));

String messageHistoryToJson(MessageHistory data) => json.encode(data.toJson());

class MessageHistory {
  String? name;
  String fromNo;
  String toNo;
  int status;
  String text;

  MessageHistory({
     this.name,
    required this.fromNo,
    required this.toNo,
    required this.status,
    required this.text,
  });

  factory MessageHistory.fromJson(Map<String, dynamic> json) => MessageHistory(
        name: json["name"],
        fromNo: json["from_no"],
        toNo: json["to_no"],
        status: json["status"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "from_no": fromNo,
        "to_no": toNo,
        "status": status,
        "text": text,
      };
}
