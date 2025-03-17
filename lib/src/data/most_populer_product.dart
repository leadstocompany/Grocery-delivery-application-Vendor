// To parse this JSON data, do
//
//     final mostPopularProduct = mostPopularProductFromJson(jsondynamic);

import 'dart:convert';

MostPopularProduct mostPopularProductFromJson(dynamic str) => MostPopularProduct.fromJson(json.decode(str));

dynamic mostPopularProductToJson(MostPopularProduct data) => json.encode(data.toJson());

class MostPopularProduct {
    List<Datum> ?data;
    Meta? meta;

    MostPopularProduct({
        this.data,
        this.meta,
    });

    factory MostPopularProduct.fromJson(Map<dynamic, dynamic> json) => MostPopularProduct(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class Datum {
    dynamic productName;
    dynamic productImage;
    dynamic productVariant;
    dynamic originalProductPrice;
    dynamic originalProductDiscountPrice;
    dynamic discountAmount;
    dynamic totalOrderItemPrice;
    dynamic totalOrderDiscount;
    int? quantity;
    dynamic soldCount;

    Datum({
        this.productName,
        this.productImage,
        this.productVariant,
        this.originalProductPrice,
        this.originalProductDiscountPrice,
        this.discountAmount,
        this.totalOrderItemPrice,
        this.totalOrderDiscount,
        this.quantity,
        this.soldCount,
    });

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        productName: json["productName"],
        productImage: json["productImage"],
        productVariant: json["productVariant"],
        originalProductPrice: json["originalProductPrice"],
        originalProductDiscountPrice: json["originalProductDiscountPrice"],
        discountAmount: json["discountAmount"],
        totalOrderItemPrice: json["totalOrderItemPrice"],
        totalOrderDiscount: json["totalOrderDiscount"],
        quantity: json["quantity"],
        soldCount: json["soldCount"],
    );

    Map<dynamic, dynamic> toJson() => {
        "productName": productName,
        "productImage": productImage,
        "productVariant": productVariant,
        "originalProductPrice": originalProductPrice,
        "originalProductDiscountPrice": originalProductDiscountPrice,
        "discountAmount": discountAmount,
        "totalOrderItemPrice": totalOrderItemPrice,
        "totalOrderDiscount": totalOrderDiscount,
        "quantity": quantity,
        "soldCount": soldCount,
    };
}

class Meta {
    int? total;
    int? page;
    int? limit;
    int? lastPage;

    Meta({
        this.total,
        this.page,
        this.limit,
        this.lastPage,
    });

    factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        lastPage: json["lastPage"],
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "lastPage": lastPage,
    };
}
