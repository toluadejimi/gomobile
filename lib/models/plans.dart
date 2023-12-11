// To parse this JSON data, do
//
//     final plans = plansFromJson(jsonString);

import 'dart:convert';

Plans plansFromJson(String str) => Plans.fromJson(json.decode(str));

String plansToJson(Plans data) => json.encode(data.toJson());

class Plans {
  List<Plan> comboPlans;
  List<Plan> smsPlan;
  List<dynamic> callPlan;

  Plans({
    required this.comboPlans,
    required this.smsPlan,
    required this.callPlan,
  });

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
        comboPlans:
            List<Plan>.from(json["combo_plans"].map((x) => Plan.fromJson(x))),
        smsPlan: List<Plan>.from(json["sms_plan"].map((x) => Plan.fromJson(x))),
        callPlan: List<dynamic>.from(json["call_plan"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "combo_plans": List<dynamic>.from(comboPlans.map((x) => x.toJson())),
        "sms_plan": List<dynamic>.from(smsPlan.map((x) => x.toJson())),
        "call_plan": List<dynamic>.from(callPlan.map((x) => x)),
      };
}

class Plan {
  int id;
  String title;
  int type;
  int amount;
  int smsCredit;
  int period;
  String note;

  Plan({
    required this.id,
    required this.title,
    required this.type,
    required this.amount,
    required this.smsCredit,
    required this.period,
    required this.note,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        amount: json["amount"],
        smsCredit: json["sms_credit"],
        period: json["period"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "amount": amount,
        "sms_credit": smsCredit,
        "period": period,
        "note": note,
      };
}
