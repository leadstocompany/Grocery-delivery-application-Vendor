// // To parse this JSON data, do
// //
// //     final myOrder = myOrderFromJson(jsondynamic);

// import 'dart:convert';

// MyOrder myOrderFromJson(dynamic str) => MyOrder.fromJson(json.decode(str));

// dynamic myOrderToJson(MyOrder data) => json.encode(data.toJson());

// class MyOrder {
//   List<DatumOrder>? data;
//   Meta? meta;

//   MyOrder({
//     this.data,
//     this.meta,
//   });

//   factory MyOrder.fromJson(Map<dynamic, dynamic> json) => MyOrder(
//         data: List<DatumOrder>.from(json["data"].map((x) => DatumOrder.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "meta": meta!.toJson(),
//       };
// }

// class DatumOrder {
//   dynamic id;
//   dynamic orderNumber;
//   dynamic userId;
//   int? totalItems;
//   dynamic subtotal;
//   dynamic deliveryCharge;
//   dynamic discount;
//   dynamic grandTotal;
//   dynamic paymentMethod;
//   dynamic paymentStatus;
//   dynamic transactionId;
//   dynamic orderStatus;
//   dynamic deliveryAddressId;
//   dynamic couponId;
//   dynamic cancelReason;
//   dynamic cancelledBy;
//   dynamic cancelledAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   User? user;
//   List<OrderItem>? orderItems;
//   DeliveryAddress? deliveryAddress;

//   List<StatusHistory>? statusHistory;
//   List<Store>? stores;

//   DatumOrder({
//     this.id,
//     this.orderNumber,
//     this.userId,
//     this.totalItems,
//     this.subtotal,
//     this.deliveryCharge,
//     this.discount,
//     this.grandTotal,
//     this.paymentMethod,
//     this.paymentStatus,
//     this.transactionId,
//     this.orderStatus,
//     this.deliveryAddressId,
//     this.couponId,
//     this.cancelReason,
//     this.cancelledBy,
//     this.cancelledAt,
//     this.createdAt,
//     this.updatedAt,
//     this.user,
//     this.orderItems,
//     this.deliveryAddress,
//     this.statusHistory,
//     this.stores,
//   });

//   factory DatumOrder.fromJson(Map<dynamic, dynamic> json) => DatumOrder(
//         id: json["id"],
//         orderNumber: json["orderNumber"],
//         userId: json["userId"],
//         totalItems: json["totalItems"],
//         subtotal: json["subtotal"],
//         deliveryCharge: json["deliveryCharge"],
//         discount: json["discount"],
//         grandTotal: json["grandTotal"],
//         paymentMethod: json["paymentMethod"],
//         paymentStatus: json["paymentStatus"],
//         transactionId: json["transactionId"],
//         orderStatus: json["orderStatus"],
//         deliveryAddressId: json["deliveryAddressId"],
//         couponId: json["couponId"],
//         cancelReason: json["cancelReason"],
//         cancelledBy: json["cancelledBy"],
//         cancelledAt: json["cancelledAt"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//         updatedAt: DateTime?.parse(json["updatedAt"]),
//         user: User.fromJson(json["user"]),
//         orderItems: List<OrderItem>.from(
//             json["orderItems"].map((x) => OrderItem.fromJson(x))),
//         deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
//         statusHistory: List<StatusHistory>.from(
//             json["statusHistory"].map((x) => StatusHistory.fromJson(x))),
//         stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "orderNumber": orderNumber,
//         "userId": userId,
//         "totalItems": totalItems,
//         "subtotal": subtotal,
//         "deliveryCharge": deliveryCharge,
//         "discount": discount,
//         "grandTotal": grandTotal,
//         "paymentMethod": paymentMethod,
//         "paymentStatus": paymentStatus,
//         "transactionId": transactionId,
//         "orderStatus": orderStatus,
//         "deliveryAddressId": deliveryAddressId,
//         "couponId": couponId,
//         "cancelReason": cancelReason,
//         "cancelledBy": cancelledBy,
//         "cancelledAt": cancelledAt,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "user": user!.toJson(),
//         "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
//         "deliveryAddress": deliveryAddress!.toJson(),
//         "statusHistory":
//             List<dynamic>.from(statusHistory!.map((x) => x.toJson())),
//         "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
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
//     this.userId,
//   });

//   factory DeliveryAddress.fromJson(Map<dynamic, dynamic> json) =>
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
//         createdAt: DateTime?.parse(json["createdAt"]),
//         updatedAt: DateTime?.parse(json["updatedAt"]),
//         userId: json["userId"],
//       );

//   Map<dynamic, dynamic> toJson() => {
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
//         "userId": userId,
//       };
// }

// class OrderItem {
//   dynamic id;
//   dynamic orderId;
//   dynamic productId;
//   dynamic storeId;
//   dynamic productName;
//   dynamic productImage;
//   dynamic productVariant;
//   int? quantity;
//   dynamic price;
//   dynamic originalPrice;
//   dynamic discountAmount;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//    OrderProduct? product;
//   // Store? store;

//   OrderItem({
//     this.id,
//     this.orderId,
//     this.productId,
//     this.storeId,
//     this.productName,
//     this.productImage,
//     this.productVariant,
//     this.quantity,
//     this.price,
//     this.originalPrice,
//     this.discountAmount,
//     this.createdAt,
//     this.updatedAt,
//      this.product,
//     // this.store,
//   });

//   factory OrderItem.fromJson(Map<dynamic, dynamic> json) => OrderItem(
//         id: json["id"],
//         orderId: json["orderId"],
//         productId: json["productId"],
//         storeId: json["storeId"],
//         productName: json["productName"],
//         productImage: json["productImage"],
//         productVariant: json["productVariant"],
//         quantity: json["quantity"],
//         price: json["price"],
//         originalPrice: json["originalPrice"],
//         discountAmount: json["discountAmount"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//         updatedAt: DateTime?.parse(json["updatedAt"]),
//          product: OrderProduct.fromJson(json["product"]),
//         // store: Store.fromJson(json["store"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "orderId": orderId,
//         "productId": productId,
//         "storeId": storeId,
//         "productName": productName,
//         "productImage": productImage,
//         "productVariant": productVariant,
//         "quantity": quantity,
//         "price": price,
//         "originalPrice": originalPrice,
//         "discountAmount": discountAmount,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//            "product": product!.toJson(),
//         // "store": store!.toJson(),
//       };
// }

// class OrderProduct {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   dynamic additionalInfo;
//   dynamic brand;
//   dynamic basePrice;
//   dynamic discountPrice;
//   int? stock;
//   int? quantity;
//   dynamic unit;
//   dynamic slug;
//   dynamic averageRating;
//   bool? isInStock;
//   bool? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic storeId;
//   dynamic categoryId;
//   dynamic productTypeId;
//   dynamic timeSlotId;
//   List<ProductImage>? productImages;
//   Category? category;
//   dynamic? productType;

//   OrderProduct({
//     this.id,
//     this.name,
//     this.description,
//     this.additionalInfo,
//     this.brand,
//     this.basePrice,
//     this.discountPrice,
//     this.stock,
//     this.quantity,
//     this.unit,
//     this.slug,
//     this.averageRating,
//     this.isInStock,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.storeId,
//     this.categoryId,
//     this.productTypeId,
//     this.timeSlotId,
//     this.productImages,
//     this.category,
//     this.productType,
//   });

//   factory OrderProduct.fromJson(Map<dynamic, dynamic> json) => OrderProduct(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         additionalInfo: json["additionalInfo"],
//         brand: json["brand"],
//         basePrice: json["basePrice"],
//         discountPrice: json["discountPrice"],
//         stock: json["stock"],
//         quantity: json["quantity"],
//         unit: json["unit"],
//         slug: json["slug"],
//         averageRating: json["averageRating"],
//         isInStock: json["isInStock"],
//         isActive: json["isActive"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//         updatedAt: DateTime?.parse(json["updatedAt"]),
//         storeId: json["storeId"],
//         categoryId: json["categoryId"],
//         productTypeId: json["productTypeId"],
//         timeSlotId: json["timeSlotId"],
//         productImages: List<ProductImage>.from(
//             json["productImages"].map((x) => ProductImage.fromJson(x))),
//         category: Category.fromJson(json["category"]),
//         productType: json["productType"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "additionalInfo": additionalInfo,
//         "brand": brand,
//         "basePrice": basePrice,
//         "discountPrice": discountPrice,
//         "stock": stock,
//         "quantity": quantity,
//         "unit": unit,
//         "slug": slug,
//         "averageRating": averageRating,
//         "isInStock": isInStock,
//         "isActive": isActive,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "storeId": storeId,
//         "categoryId": categoryId,
//         "productTypeId": productTypeId,
//         "timeSlotId": timeSlotId,
//         "productImages":
//             List<dynamic>.from(productImages!.map((x) => x.toJson())),
//         "category": category!.toJson(),
//         "productType": productType,
//       };
// }

// class Category {
//   dynamic id;
//   dynamic name;
//   dynamic path;

//   Category({
//     this.id,
//     this.name,
//     this.path,
//   });

//   factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         path: json["path"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "path": path,
//       };
// }

// class ProductImage {
//   dynamic id;
//   dynamic url;
//   bool? isDefault;
//   dynamic productId;

//   ProductImage({
//     this.id,
//     this.url,
//     this.isDefault,
//     this.productId,
//   });

//   factory ProductImage.fromJson(Map<dynamic, dynamic> json) => ProductImage(
//         id: json["id"],
//         url: json["url"],
//         isDefault: json["isDefault"],
//         productId: json["productId"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "isDefault": isDefault,
//         "productId": productId,
//       };
// }

// class Store {
//   dynamic id;
//   dynamic storeName;
//   dynamic storePicture;
//   dynamic storeAddress;
//   dynamic officialPhoneNumber;
//   User? vendor;
//   OperateDates? operateDates;
//   OperateTimes? operateTimes;

//   Store({
//     this.id,
//     this.storeName,
//     this.storePicture,
//     this.storeAddress,
//     this.officialPhoneNumber,
//     this.vendor,
//     this.operateDates,
//     this.operateTimes,
//   });

//   factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
//         id: json["id"],
//         storeName: json["storeName"],
//         storePicture: json["storePicture"],
//         storeAddress: json["storeAddress"],
//         officialPhoneNumber: json["officialPhoneNumber"],
//         vendor: User.fromJson(json["vendor"]),
//         operateDates: OperateDates.fromJson(json["operateDates"]),
//         operateTimes: OperateTimes.fromJson(json["operateTimes"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "storeName": storeName,
//         "storePicture": storePicture,
//         "storeAddress": storeAddress,
//         "officialPhoneNumber": officialPhoneNumber,
//         "vendor": vendor!.toJson(),
//         "operateDates": operateDates!.toJson(),
//         "operateTimes": operateTimes!.toJson(),
//       };
// }

// class OperateDates {
//   dynamic id;
//   bool? monday;
//   bool? tuesday;
//   bool? wednesday;
//   bool? thursday;
//   bool? friday;
//   bool? saturday;
//   bool? sunday;
//   dynamic storeId;

//   OperateDates({
//     this.id,
//     this.monday,
//     this.tuesday,
//     this.wednesday,
//     this.thursday,
//     this.friday,
//     this.saturday,
//     this.sunday,
//     this.storeId,
//   });

//   factory OperateDates.fromJson(Map<dynamic, dynamic> json) => OperateDates(
//         id: json["id"],
//         monday: json["monday"],
//         tuesday: json["tuesday"],
//         wednesday: json["wednesday"],
//         thursday: json["thursday"],
//         friday: json["friday"],
//         saturday: json["saturday"],
//         sunday: json["sunday"],
//         storeId: json["storeId"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "monday": monday,
//         "tuesday": tuesday,
//         "wednesday": wednesday,
//         "thursday": thursday,
//         "friday": friday,
//         "saturday": saturday,
//         "sunday": sunday,
//         "storeId": storeId,
//       };
// }

// class OperateTimes {
//   dynamic id;
//   dynamic startTime;
//   dynamic endTime;
//   dynamic storeId;

//   OperateTimes({
//     this.id,
//     this.startTime,
//     this.endTime,
//     this.storeId,
//   });

//   factory OperateTimes.fromJson(Map<dynamic, dynamic> json) => OperateTimes(
//         id: json["id"],
//         startTime: json["startTime"],
//         endTime: json["endTime"],
//         storeId: json["storeId"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "startTime": startTime,
//         "endTime": endTime,
//         "storeId": storeId,
//       };
// }

// class User {
//   dynamic id;
//   dynamic email;
//   dynamic firstName;
//   dynamic lastName;
//   dynamic phone;
//   dynamic role;

//   User({
//     this.id,
//     this.email,
//     this.firstName,
//     this.lastName,
//     this.phone,
//     this.role,
//   });

//   factory User.fromJson(Map<dynamic, dynamic> json) => User(
//         id: json["id"],
//         email: json["email"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         phone: json["phone"],
//         role: json["role"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "firstName": firstName,
//         "lastName": lastName,
//         "phone": phone,
//         "role": role,
//       };
// }

// class StatusHistory {
//   dynamic id;
//   dynamic orderId;
//   dynamic status;
//   dynamic comment;
//   dynamic updatedBy;
//   DateTime? createdAt;

//   StatusHistory({
//     this.id,
//     this.orderId,
//     this.status,
//     this.comment,
//     this.updatedBy,
//     this.createdAt,
//   });

//   factory StatusHistory.fromJson(Map<dynamic, dynamic> json) => StatusHistory(
//         id: json["id"],
//         orderId: json["orderId"],
//         status: json["status"],
//         comment: json["comment"],
//         updatedBy: json["updatedBy"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "orderId": orderId,
//         "status": status,
//         "comment": comment,
//         "updatedBy": updatedBy,
//         "createdAt": createdAt,
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

//   factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
//         total: json["total"],
//         page: json["page"],
//         limit: json["limit"],
//         lastPage: json["lastPage"],
//         hasNextPage: json["hasNextPage"],
//         hasPreviousPage: json["hasPreviousPage"],
//       );

//   Map<dynamic, dynamic> toJson() => {
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
//     final datumOrder = datumOrderFromJson(jsondynamic);

import 'dart:convert';

MyOrder myOrderFromJson(dynamic str) => MyOrder.fromJson(json.decode(str));

dynamic myOrderToJson(MyOrder data) => json.encode(data.toJson());

class MyOrder {
  List<DatumOrder>? data;
  Meta? meta;

  MyOrder({
    this.data,
    this.meta,
  });

  factory MyOrder.fromJson(Map<dynamic, dynamic> json) => MyOrder(
        data: List<DatumOrder>.from(
            json["data"].map((x) => DatumOrder.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class DatumOrder {
  dynamic id;
  dynamic orderNumber;
  dynamic orderStatus;
  dynamic paymentStatus;
  dynamic paymentMethod;
  DateTime? createdAt;
  DateTime? updatedAt;
  Customer? customer;
  DeliveryAddress? deliveryAddress;
  List<Item>? items;
  dynamic storeSubtotal;
  int? storeTotalItems;
  List<StatusHistory>? statusHistory;

  DatumOrder({
    this.id,
    this.orderNumber,
    this.orderStatus,
    this.paymentStatus,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.deliveryAddress,
    this.items,
    this.storeSubtotal,
    this.storeTotalItems,
    this.statusHistory,
  });

  factory DatumOrder.fromJson(Map<dynamic, dynamic> json) => DatumOrder(
        id: json["id"],
        orderNumber: json["orderNumber"],
        orderStatus: json["orderStatus"],
        paymentStatus: json["paymentStatus"],
        paymentMethod: json["paymentMethod"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        customer: Customer.fromJson(json["customer"]),
        deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        storeSubtotal: json["storeSubtotal"],
        storeTotalItems: json["storeTotalItems"],
        statusHistory: List<StatusHistory>.from(
            json["statusHistory"].map((x) => StatusHistory.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "orderNumber": orderNumber,
        "orderStatus": orderStatus,
        "paymentStatus": paymentStatus,
        "paymentMethod": paymentMethod,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "customer": customer!.toJson(),
        "deliveryAddress": deliveryAddress!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "storeSubtotal": storeSubtotal,
        "storeTotalItems": storeTotalItems,
        "statusHistory":
            List<dynamic>.from(statusHistory!.map((x) => x.toJson())),
      };
}

class Customer {
  dynamic name;
  dynamic email;
  dynamic phone;

  Customer({
    this.name,
    this.email,
    this.phone,
  });

  factory Customer.fromJson(Map<dynamic, dynamic> json) => Customer(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}

class DeliveryAddress {
  dynamic addressLine;
  dynamic city;
  dynamic state;
  dynamic pincode;
  dynamic phoneNumber;

  DeliveryAddress({
    this.addressLine,
    this.city,
    this.state,
    this.pincode,
    this.phoneNumber,
  });

  factory DeliveryAddress.fromJson(Map<dynamic, dynamic> json) =>
      DeliveryAddress(
        addressLine: json["addressLine"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<dynamic, dynamic> toJson() => {
        "addressLine": addressLine,
        "city": city,
        "state": state,
        "pincode": pincode,
        "phoneNumber": phoneNumber,
      };
}

class Item {
  dynamic id;
  dynamic productName;
  int? quantity;
  dynamic price;
  dynamic originalPrice;
  dynamic discountAmount;
  OrderProduct? product;

  Item({
    this.id,
    this.productName,
    this.quantity,
    this.price,
    this.originalPrice,
    this.discountAmount,
    this.product,
  });

  factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
        id: json["id"],
        productName: json["productName"],
        quantity: json["quantity"],
        price: json["price"],
        originalPrice: json["originalPrice"],
        discountAmount: json["discountAmount"],
        product: OrderProduct.fromJson(json["product"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "quantity": quantity,
        "price": price,
        "originalPrice": originalPrice,
        "discountAmount": discountAmount,
        "product": product!.toJson(),
      };
}

class OrderProduct {
  dynamic id;
  dynamic name;
  dynamic description;

  OrderProduct({
    this.id,
    this.name,
    this.description,
  });

  factory OrderProduct.fromJson(Map<dynamic, dynamic> json) => OrderProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class StatusHistory {
  dynamic status;
  dynamic comment;
  DateTime? createdAt;

  StatusHistory({
    this.status,
    this.comment,
    this.createdAt,
  });

  factory StatusHistory.fromJson(Map<dynamic, dynamic> json) => StatusHistory(
        status: json["status"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "status": status,
        "comment": comment,
        "createdAt": createdAt,
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

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        lastPage: json["lastPage"],
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
      );

  Map<dynamic, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "lastPage": lastPage,
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
      };
}
