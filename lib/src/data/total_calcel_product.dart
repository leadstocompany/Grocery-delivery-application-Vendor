// To parse this JSON data, do
//
//     final insightsTotalCancelledOrder = insightsTotalCancelledOrderFromJson(jsonString);

import 'dart:convert';

InsightsTotalCancelledOrder insightsTotalCancelledOrderFromJson(String str) => InsightsTotalCancelledOrder.fromJson(json.decode(str));

String insightsTotalCancelledOrderToJson(InsightsTotalCancelledOrder data) => json.encode(data.toJson());

class InsightsTotalCancelledOrder {
    int ?totalCancelledOrders;
    dynamic growthPercentage;

    InsightsTotalCancelledOrder({
        this.totalCancelledOrders,
        this.growthPercentage,
    });

    factory InsightsTotalCancelledOrder.fromJson(Map<String, dynamic> json) => InsightsTotalCancelledOrder(
        totalCancelledOrders: json["totalCancelledOrders"],
        growthPercentage: json["growthPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "totalCancelledOrders": totalCancelledOrders,
        "growthPercentage": growthPercentage,
    };
}
