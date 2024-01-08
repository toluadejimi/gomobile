// To parse this JSON data, do
//
//     final serviceProvider = serviceProviderFromJson(jsonString);

import 'dart:convert';

ServiceProvider serviceProviderFromJson(String str) =>
    ServiceProvider.fromJson(json.decode(str));

String serviceProviderToJson(ServiceProvider data) =>
    json.encode(data.toJson());

class ServiceProvider {
  String operatorId;
  String name;
  int productId;

  ServiceProvider({
    required this.operatorId,
    required this.name,
    required this.productId,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        operatorId: json["operator_id"],
        name: json["name"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "operator_id": operatorId,
        "name": name,
        "product_id": productId,
      };
}
