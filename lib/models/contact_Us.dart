// To parse this JSON data, do
//
//     final contactUs = contactUsFromJson(jsonString);

import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
    bool status;
    Data data;

    ContactUs({
        required this.status,
        required this.data,
    });

    factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String phoneNo;
    String email;

    Data({
        required this.phoneNo,
        required this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        phoneNo: json["phone_no"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "email": email,
    };
}
