// To parse this JSON data, do
//
//     final ServiceProduct = ServiceProductFromJson(jsonString);

import 'dart:convert';

ServiceProduct serviceProductFromJson(String str) =>
    ServiceProduct.fromJson(json.decode(str));

String serviceProductToJson(ServiceProduct data) => json.encode(data.toJson());

class ServiceProduct {
  String productId;
  String productName;
  int min;
  int max;
  double rate;
  String fixedPrice;

  ServiceProduct({
    required this.productId,
    required this.productName,
    required this.min,
    required this.max,
    required this.rate,
    required this.fixedPrice,
  });

  factory ServiceProduct.fromJson(Map<String, dynamic> json) => ServiceProduct(
        productId: json["product_id"],
        productName: json["product_name"],
        min: double.parse(json["min"].toString()).toInt(),
        max: double.parse(json["max"].toString()).toInt(),
        rate: json["rate"]?.toDouble(),
        fixedPrice: json["fixed_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "min": min,
        "max": max,
        "rate": rate,
        "fixed_price": fixedPrice,
      };
}
