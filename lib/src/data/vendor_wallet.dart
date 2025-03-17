

// import 'dart:convert';

// VendorWallet vendorWalletFromJson(String str) =>
//     VendorWallet.fromJson(json.decode(str));

// String vendorWalletToJson(VendorWallet data) => json.encode(data.toJson());

// class VendorWallet {
//   List<WalletData>? data;
//   Meta? meta;

//   VendorWallet({
//     this.data,
//     this.meta,
//   });

//   factory VendorWallet.fromJson(Map<String, dynamic> json) => VendorWallet(
//         data: List<WalletData>.from(
//             json["data"].map((x) => WalletData.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "meta": meta!.toJson(),
//       };
// }

// class WalletData {
//   String? weekStart;
//   String? weekEnd;
//   List<Order>? orders;
//   Totals? totals;

//   WalletData({
//     this.weekStart,
//     this.weekEnd,
//     this.orders,
//     this.totals,
//   });

//   factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
//         weekStart: json["weekStart"],
//         weekEnd: json["weekEnd"],
//         orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
//         totals: Totals.fromJson(json["totals"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "weekStart": weekStart,
//         "weekEnd": weekEnd,
//         "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
//         "totals": totals!.toJson(),
//       };
// }

// class Order {
//   dynamic id;
//   dynamic orderNumber;
//   dynamic orderStatus;
//   dynamic paymentStatus;
//   dynamic paymentMethod;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Customer? customer;
//   DeliveryAddress? deliveryAddress;
//   List<Item>? items;
//   int? totalItems;
//   double? totalCommission;
//   double? totalNetAmount;
//   int? totalOrderItemPrice;

//   Order({
//     this.id,
//     this.orderNumber,
//     this.orderStatus,
//     this.paymentStatus,
//     this.paymentMethod,
//     this.createdAt,
//     this.updatedAt,
//     this.customer,
//     this.deliveryAddress,
//     this.items,
//     this.totalItems,
//     this.totalCommission,
//     this.totalNetAmount,
//     this.totalOrderItemPrice,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json["id"],
//         orderNumber: json["orderNumber"],
//         orderStatus: json["orderStatus"],
//         paymentStatus: json["paymentStatus"],
//         paymentMethod: json["paymentMethod"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         customer: Customer.fromJson(json["customer"]),
//         deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         totalItems: json["totalItems"],
//         totalCommission: json["totalCommission"].toDouble(),
//         totalNetAmount: json["totalNetAmount"].toDouble(),
//         totalOrderItemPrice: json["totalOrderItemPrice"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "orderNumber": orderNumber,
//         "orderStatus": orderStatus,
//         "paymentStatus": paymentStatus,
//         "paymentMethod": paymentMethod,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "customer": customer!.toJson(),
//         "deliveryAddress": deliveryAddress!.toJson(),
//         "items": List<dynamic>.from(items!.map((x) => x.toJson())),
//         "totalItems": totalItems,
//         "totalCommission": totalCommission,
//         "totalNetAmount": totalNetAmount,
//         "totalOrderItemPrice": totalOrderItemPrice,
//       };
// }

// class Customer {
//   dynamic id;
//   dynamic name;
//   dynamic email;
//   dynamic phone;

//   Customer({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//   });

//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         phone: json["phone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "phone": phone,
//       };
// }

// class DeliveryAddress {
//   dynamic id;
//   dynamic pincode;
//   dynamic phoneNumber;
//   dynamic alternatePhoneNumber;
//   dynamic addressLine;
//   dynamic landmark;
//   dynamic addressType;
//   dynamic city;
//   dynamic district;
//   dynamic name;
//   dynamic state;
//   dynamic country;
//   bool? isDeliverable;
//   bool? isDefault;
//   dynamic additionalInstructions;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   double? latitude;
//   double? longitude;
//   dynamic userId;

//   DeliveryAddress({
//     this.id,
//     this.pincode,
//     this.phoneNumber,
//     this.alternatePhoneNumber,
//     this.addressLine,
//     this.landmark,
//     this.addressType,
//     this.city,
//     this.district,
//     this.name,
//     this.state,
//     this.country,
//     this.isDeliverable,
//     this.isDefault,
//     this.additionalInstructions,
//     this.createdAt,
//     this.updatedAt,
//     this.latitude,
//     this.longitude,
//     this.userId,
//   });

//   factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
//       DeliveryAddress(
//         id: json["id"],
//         pincode: json["pincode"],
//         phoneNumber: json["phoneNumber"],
//         alternatePhoneNumber: json["alternatePhoneNumber"],
//         addressLine: json["addressLine"],
//         landmark: json["landmark"],
//         addressType: json["addressType"],
//         city: json["city"],
//         district: json["district"],
//         name: json["name"],
//         state: json["state"],
//         country: json["country"],
//         isDeliverable: json["isDeliverable"],
//         isDefault: json["isDefault"],
//         additionalInstructions: json["additionalInstructions"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         userId: json["userId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "pincode": pincode,
//         "phoneNumber": phoneNumber,
//         "alternatePhoneNumber": alternatePhoneNumber,
//         "addressLine": addressLine,
//         "landmark": landmark,
//         "addressType": addressType,
//         "city": city,
//         "district": district,
//         "name": name,
//         "state": state,
//         "country": country,
//         "isDeliverable": isDeliverable,
//         "isDefault": isDefault,
//         "additionalInstructions": additionalInstructions,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "latitude": latitude,
//         "longitude": longitude,
//         "userId": userId,
//       };
// }

// class Item {
//   dynamic id;
//   dynamic productId;
//   dynamic storeId;
//   dynamic status;
//   int? quantity;
//   dynamic productName;
//   dynamic productImage;
//   dynamic productVariant;
//   dynamic originalProductPrice;
//   dynamic originalProductDiscountPrice;
//   dynamic discountAmount;
//   dynamic totalOrderItemPrice;
//   dynamic totalOrderDiscount;
//   dynamic commission;
//   dynamic netAmount;
//   VendorPayment? vendorPayment;

//   Item({
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
//   dynamic paymentDate;
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
//         paymentDate: json["paymentDate"],
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
//   double? totalCommission;
//   double? totalNetAmount;
//   int? totalOrderItemPrice;
//   int? totalItems;
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

// class Meta {
//   int? total;
//   int? page;
//   int? limit;
//   int? lastPage;
//   bool? hasNextPage;
//   bool? hasPreviousPage;

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

// To parse this JSON data, do
//
//     final vendorWallet = vendorWalletFromJson(jsonString);

import 'dart:convert';

VendorWallet vendorWalletFromJson(String str) => VendorWallet.fromJson(json.decode(str));

String vendorWalletToJson(VendorWallet data) => json.encode(data.toJson());

class VendorWallet {
    List<WalletData>? data;
    Meta? meta;

    VendorWallet({
        this.data,
        this.meta,
    });

    factory VendorWallet.fromJson(Map<String, dynamic> json) => VendorWallet(
        data: List<WalletData>.from(json["data"].map((x) => WalletData.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
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
    dynamic orderNumber;
    dynamic orderStatus;
    dynamic paymentStatus;
    dynamic paymentMethod;
    dynamic id;
    dynamic productId;
    dynamic storeId;
    dynamic status;
    int? quantity;
    dynamic productName;
    dynamic productImage;
    dynamic productVariant;
    dynamic originalProductPrice;
    dynamic originalProductDiscountPrice;
    dynamic discountAmount;
    dynamic totalOrderItemPrice;
    dynamic totalOrderDiscount;
    dynamic commission;
    dynamic netAmount;
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
    dynamic id;
    dynamic status;
    DateTime? paymentDate;
    dynamic amount;
    DateTime? createdAt;
    DateTime? updatedAt;

    VendorPayment({
        this.id,
        this.status,
        this.paymentDate,
        this.amount,
        this.createdAt,
        this.updatedAt,
    });

    factory VendorPayment.fromJson(Map<String, dynamic> json) => VendorPayment(
        id: json["id"],
        status: json["status"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        amount: json["amount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "paymentDate": paymentDate,
        "amount": amount,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class Totals {
    double? totalCommission;
    double? totalNetAmount;
    int? totalOrderItemPrice;
    int? totalItems;
    bool? status;

    Totals({
        this.totalCommission,
        this.totalNetAmount,
        this.totalOrderItemPrice,
        this.totalItems,
        this.status,
    });

    factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        totalCommission: json["totalCommission"].toDouble(),
        totalNetAmount: json["totalNetAmount"].toDouble(),
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

class Meta {
    int? total;
    int? page;
    int? limit;
    int? lastPage;
    bool? hasNextPage;
    bool? hasPreviousPage;

    Meta({
        this.total,
        this.page,
        this.limit,
        this.lastPage,
        this.hasNextPage,
        this.hasPreviousPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        lastPage: json["lastPage"],
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "lastPage": lastPage,
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
    };
}

