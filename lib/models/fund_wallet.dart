// To parse this JSON data, do
//
//     final fundWallet = fundWalletFromJson(jsonString);

import 'dart:convert';

FundWallet fundWalletFromJson(String str) =>
    FundWallet.fromJson(json.decode(str));

String fundWalletToJson(FundWallet data) => json.encode(data.toJson());

class FundWallet {
  String href;

  FundWallet({
    required this.href,
  });

  factory FundWallet.fromJson(Map<String, dynamic> json) => FundWallet(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}
