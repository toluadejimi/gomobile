// To parse this JSON data, do
//
//     final recentTransaction = recentTransactionFromJson(jsonString);

import 'dart:convert';

RecentTransaction recentTransactionFromJson(String str) =>
    RecentTransaction.fromJson(json.decode(str));

String recentTransactionToJson(RecentTransaction data) =>
    json.encode(data.toJson());

class RecentTransaction {
  String trxId;
  int status;
  int type;
  String createdAt;
  int? amount;

  RecentTransaction({
    required this.trxId,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.amount,
  });

  factory RecentTransaction.fromJson(Map<String, dynamic> json) =>
      RecentTransaction(
        trxId: json["trx_id"],
        status: json["status"],
        type: json["type"],
        createdAt: json["created_at"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "status": status,
        "type": type,
        "created_at": createdAt,
        "amount": amount,
      };
}
