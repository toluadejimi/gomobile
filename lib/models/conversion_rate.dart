// To parse this JSON data, do
//
//     final conversionRate = conversionRateFromJson(jsonString);

import 'dart:convert';

ConversionRate conversionRateFromJson(String str) => ConversionRate.fromJson(json.decode(str));

String conversionRateToJson(ConversionRate data) => json.encode(data.toJson());

class ConversionRate {
    int rate;

    ConversionRate({
        required this.rate,
    });

    factory ConversionRate.fromJson(Map<String, dynamic> json) => ConversionRate(
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
    };
}