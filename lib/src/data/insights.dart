// To parse this JSON data, do
//
//     final insightsTotalOrder = insightsTotalOrderFromJson(jsonString);

import 'dart:convert';

InsightsTotalOrder insightsTotalOrderFromJson(String str) => InsightsTotalOrder.fromJson(json.decode(str));

String insightsTotalOrderToJson(InsightsTotalOrder data) => json.encode(data.toJson());

class InsightsTotalOrder {
    int? totalOrders;
    dynamic? growthPercentage;

    InsightsTotalOrder({
        this.totalOrders,
        this.growthPercentage,
    });

    factory InsightsTotalOrder.fromJson(Map<String, dynamic> json) => InsightsTotalOrder(
        totalOrders: json["totalOrders"],
        growthPercentage: json["growthPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "totalOrders": totalOrders,
        "growthPercentage": growthPercentage,
    };
}
