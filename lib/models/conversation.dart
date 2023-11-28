// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

Conversation conversationFromJson(String str) =>
    Conversation.fromJson(json.decode(str));

String conversationToJson(Conversation data) => json.encode(data.toJson());

class Conversation {
  int id;
  String fromNo;
  String toNo;
  int status;
  dynamic media;
  String text;
  DateTime createdAt;

  Conversation({
    required this.id,
    required this.fromNo,
    required this.toNo,
    required this.status,
    required this.media,
    required this.text,
    required this.createdAt,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
        id: json["id"],
        fromNo: json["from_no"],
        toNo: json["to_no"],
        status: json["status"],
        media: json["media"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from_no": fromNo,
        "to_no": toNo,
        "status": status,
        "media": media,
        "text": text,
        "created_at": createdAt.toIso8601String(),
      };
}
