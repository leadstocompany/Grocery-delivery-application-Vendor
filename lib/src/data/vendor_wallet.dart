// import 'dart:convert';

// VendorWallet vendorWalletFromJson(String str) =>
//     VendorWallet.fromJson(json.decode(str));

// String vendorWalletToJson(VendorWallet data) => json.encode(data.toJson());

// class VendorWallet {
//   List<WalletData>? data;
//  // Meta? meta;

//   VendorWallet({
//     this.data,
//     //this.meta,
//   });

//   factory VendorWallet.fromJson(Map<String, dynamic> json) => VendorWallet(
//         data: List<WalletData>.from(
//             json["data"].map((x) => WalletData.fromJson(x))),
//       //  meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//        // "meta": meta!.toJson(),
//       };
// }

// class WalletData {
//   dynamic? weekStart;
//   dynamic? weekEnd;
//   List<Item>? items;
//   Totals? totals;

//   WalletData({
//     this.weekStart,
//     this.weekEnd,
//     this.items,
//     this.totals,
//   });

//   factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
//         weekStart: json["weekStart"],
//         weekEnd: json["weekEnd"],
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         totals: Totals.fromJson(json["totals"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "weekStart": weekStart,
//         "weekEnd": weekEnd,
//         "items": List<dynamic>.from(items!.map((x) => x.toJson())),
//         "totals": totals!.toJson(),
//       };
// }

// class Item {
//   dynamic orderNumber;
//   dynamic orderStatus;
//   dynamic paymentStatus;
//   dynamic paymentMethod;
//   dynamic id;
//   dynamic productId;
//   dynamic storeId;
//   dynamic status;
//   dynamic? quantity;
//   dynamic productName;
//   dynamic productImage;
//   dynamic productVariant;
//   String? originalProductPrice;
//   dynamic originalProductDiscountPrice;
//   dynamic discountAmount;
//   dynamic totalOrderItemPrice;
//   dynamic totalOrderDiscount;
//   dynamic commission;
//   dynamic netAmount;
//   VendorPayment? vendorPayment;

//   Item({
//     this.orderNumber,
//     this.orderStatus,
//     this.paymentStatus,
//     this.paymentMethod,
//     this.id,
//     this.productId,
//     this.storeId,
//     this.status,
//     this.quantity,
//     this.productName,
//     this.productImage,
//     this.productVariant,
//     this.originalProductPrice,
//     this.originalProductDiscountPrice,
//     this.discountAmount,
//     this.totalOrderItemPrice,
//     this.totalOrderDiscount,
//     this.commission,
//     this.netAmount,
//     this.vendorPayment,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         orderNumber: json["orderNumber"],
//         orderStatus: json["orderStatus"],
//         paymentStatus: json["paymentStatus"],
//         paymentMethod: json["paymentMethod"],
//         id: json["id"],
//         productId: json["productId"],
//         storeId: json["storeId"],
//         status: json["status"],
//         quantity: json["quantity"],
//         productName: json["productName"],
//         productImage: json["productImage"],
//         productVariant: json["productVariant"],
//         originalProductPrice: json["originalProductPrice"],
//         originalProductDiscountPrice: json["originalProductDiscountPrice"],
//         discountAmount: json["discountAmount"],
//         totalOrderItemPrice: json["totalOrderItemPrice"],
//         totalOrderDiscount: json["totalOrderDiscount"],
//         commission: json["commission"],
//         netAmount: json["netAmount"],
//         vendorPayment: VendorPayment.fromJson(json["vendorPayment"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "orderNumber": orderNumber,
//         "orderStatus": orderStatus,
//         "paymentStatus": paymentStatus,
//         "paymentMethod": paymentMethod,
//         "id": id,
//         "productId": productId,
//         "storeId": storeId,
//         "status": status,
//         "quantity": quantity,
//         "productName": productName,
//         "productImage": productImage,
//         "productVariant": productVariant,
//         "originalProductPrice": originalProductPrice,
//         "originalProductDiscountPrice": originalProductDiscountPrice,
//         "discountAmount": discountAmount,
//         "totalOrderItemPrice": totalOrderItemPrice,
//         "totalOrderDiscount": totalOrderDiscount,
//         "commission": commission,
//         "netAmount": netAmount,
//         "vendorPayment": vendorPayment!.toJson(),
//       };
// }

// class VendorPayment {
//   dynamic id;
//   dynamic status;
//   DateTime? paymentDate;
//   dynamic amount;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   VendorPayment({
//     this.id,
//     this.status,
//     this.paymentDate,
//     this.amount,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory VendorPayment.fromJson(Map<String, dynamic> json) => VendorPayment(
//         id: json["id"],
//         status: json["status"],
//         paymentDate: DateTime.parse(json["paymentDate"]),
//         amount: json["amount"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "paymentDate": paymentDate,
//         "amount": amount,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//       };
// }

// class Totals {
//   dynamic? totalCommission;
//   dynamic? totalNetAmount;
//   dynamic? totalOrderItemPrice;
//   dynamic? totalItems;
//   bool? status;

//   Totals({
//     this.totalCommission,
//     this.totalNetAmount,
//     this.totalOrderItemPrice,
//     this.totalItems,
//     this.status,
//   });

//   factory Totals.fromJson(Map<String, dynamic> json) => Totals(
//         totalCommission: json["totalCommission"].toDouble(),
//         totalNetAmount: json["totalNetAmount"].toDouble(),
//         totalOrderItemPrice: json["totalOrderItemPrice"],
//         totalItems: json["totalItems"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "totalCommission": totalCommission,
//         "totalNetAmount": totalNetAmount,
//         "totalOrderItemPrice": totalOrderItemPrice,
//         "totalItems": totalItems,
//         "status": status,
//       };
// }

// // class Meta {
// //   int? total;
// //   int? page;
// //   int? limit;
// //   int? lastPage;
// //   bool? hasNextPage;
// //   bool? hasPreviousPage;

// //   Meta({
// //     this.total,
// //     this.page,
// //     this.limit,
// //     this.lastPage,
// //     this.hasNextPage,
// //     this.hasPreviousPage,
// //   });

// //   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
// //         total: json["total"],
// //         page: json["page"],
// //         limit: json["limit"],
// //         lastPage: json["lastPage"],
// //         hasNextPage: json["hasNextPage"],
// //         hasPreviousPage: json["hasPreviousPage"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "total": total,
// //         "page": page,
// //         "limit": limit,
// //         "lastPage": lastPage,
// //         "hasNextPage": hasNextPage,
// //         "hasPreviousPage": hasPreviousPage,
// //       };
// // }

// To parse this JSON data, do
//
//     final vendorWallet = vendorWalletFromJson(jsonString);

import 'dart:convert';

VendorWallet vendorWalletFromJson(String str) =>
    VendorWallet.fromJson(json.decode(str));

String vendorWalletToJson(VendorWallet data) => json.encode(data.toJson());

class VendorWallet {
  List<WalletData>? data;
//  Meta? meta;

  VendorWallet({
    this.data,
    //  this.meta,
  });

  factory VendorWallet.fromJson(Map<String, dynamic> json) => VendorWallet(
        data: List<WalletData>.from(
            json["data"].map((x) => WalletData.fromJson(x))),
        // meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        // "meta": meta!.toJson(),
      };
}

class WalletData {
  String? weekStart;
  String? weekEnd;
  List<Item>? items;
  Totals? totals;

  WalletData({
    this.weekStart,
    this.weekEnd,
    this.items,
    this.totals,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
        weekStart: json["weekStart"],
        weekEnd: json["weekEnd"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totals: Totals.fromJson(json["totals"]),
      );

  Map<String, dynamic> toJson() => {
        "weekStart": weekStart,
        "weekEnd": weekEnd,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "totals": totals!.toJson(),
      };
}

class Item {
  String? orderNumber;
  String? orderStatus;
  String? paymentStatus;
  String? paymentMethod;
  String? id;
  String? productId;
  String? storeId;
  String? status;
  int? quantity;
  String? productName;
  String? productImage;
  String? productVariant;
  String? originalProductPrice;
  String? originalProductDiscountPrice;
  String? discountAmount;
  String? totalOrderItemPrice;
  String? totalOrderDiscount;
  String? commission;
  String? netAmount;
  VendorPayment? vendorPayment;

  Item({
    this.orderNumber,
    this.orderStatus,
    this.paymentStatus,
    this.paymentMethod,
    this.id,
    this.productId,
    this.storeId,
    this.status,
    this.quantity,
    this.productName,
    this.productImage,
    this.productVariant,
    this.originalProductPrice,
    this.originalProductDiscountPrice,
    this.discountAmount,
    this.totalOrderItemPrice,
    this.totalOrderDiscount,
    this.commission,
    this.netAmount,
    this.vendorPayment,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        orderNumber: json["orderNumber"],
        orderStatus: json["orderStatus"],
        paymentStatus: json["paymentStatus"],
        paymentMethod: json["paymentMethod"],
        id: json["id"],
        productId: json["productId"],
        storeId: json["storeId"],
        status: json["status"],
        quantity: json["quantity"],
        productName: json["productName"],
        productImage: json["productImage"],
        productVariant: json["productVariant"],
        originalProductPrice: json["originalProductPrice"],
        originalProductDiscountPrice: json["originalProductDiscountPrice"],
        discountAmount: json["discountAmount"],
        totalOrderItemPrice: json["totalOrderItemPrice"],
        totalOrderDiscount: json["totalOrderDiscount"],
        commission: json["commission"],
        netAmount: json["netAmount"],
        vendorPayment: VendorPayment.fromJson(json["vendorPayment"]),
      );

  Map<String, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "orderStatus": orderStatus,
        "paymentStatus": paymentStatus,
        "paymentMethod": paymentMethod,
        "id": id,
        "productId": productId,
        "storeId": storeId,
        "status": status,
        "quantity": quantity,
        "productName": productName,
        "productImage": productImage,
        "productVariant": productVariant,
        "originalProductPrice": originalProductPrice,
        "originalProductDiscountPrice": originalProductDiscountPrice,
        "discountAmount": discountAmount,
        "totalOrderItemPrice": totalOrderItemPrice,
        "totalOrderDiscount": totalOrderDiscount,
        "commission": commission,
        "netAmount": netAmount,
        "vendorPayment": vendorPayment!.toJson(),
      };
}

class VendorPayment {
  String? id;
  String? status;

  String? amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  VendorPayment({
    this.id,
    this.status,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory VendorPayment.fromJson(Map<String, dynamic> json) => VendorPayment(
        id: json["id"],
        status: json["status"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "amount": amount,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Totals {
  dynamic totalCommission;
  dynamic totalNetAmount;
  dynamic? totalOrderItemPrice;
  dynamic? totalItems;
  bool? status;

  Totals({
    this.totalCommission,
    this.totalNetAmount,
    this.totalOrderItemPrice,
    this.totalItems,
    this.status,
  });

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        totalCommission: json["totalCommission"],
        totalNetAmount: json["totalNetAmount"],
        totalOrderItemPrice: json["totalOrderItemPrice"],
        totalItems: json["totalItems"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "totalCommission": totalCommission,
        "totalNetAmount": totalNetAmount,
        "totalOrderItemPrice": totalOrderItemPrice,
        "totalItems": totalItems,
        "status": status,
      };
}

// class Meta {
//   int total;
//   int page;
//   int limit;
//   int lastPage;
//   bool hasNextPage;
//   bool hasPreviousPage;

//   Meta({
//     this.total,
//     this.page,
//     this.limit,
//     this.lastPage,
//     this.hasNextPage,
//     this.hasPreviousPage,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         total: json["total"],
//         page: json["page"],
//         limit: json["limit"],
//         lastPage: json["lastPage"],
//         hasNextPage: json["hasNextPage"],
//         hasPreviousPage: json["hasPreviousPage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "page": page,
//         "limit": limit,
//         "lastPage": lastPage,
//         "hasNextPage": hasNextPage,
//         "hasPreviousPage": hasPreviousPage,
//       };
// }
