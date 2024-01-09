// To parse this JSON data, do
//
//     final fundWallet = fundWalletFromJson(jsonString);

import 'dart:convert';

SendMoneyToBank sendMoneyToBankFromJson(String str) =>
    SendMoneyToBank.fromJson(json.decode(str));

String sendMoneyToBankToJson(SendMoneyToBank data) => json.encode(data.toJson());

class SendMoneyToBank {
  String url;

  SendMoneyToBank({
    required this.url,
  });

  factory SendMoneyToBank.fromJson(Map<String, dynamic> json) => SendMoneyToBank(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
