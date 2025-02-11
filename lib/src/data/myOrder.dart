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
//         data: List<DatumOrder>.from(
//             json["data"].map((x) => DatumOrder.fromJson(x))),
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
//   dynamic orderStatus;
//   dynamic paymentStatus;
//   dynamic paymentMethod;
//   DateTime?? createdAt;
//   DateTime?? updatedAt;
//   Customer? customer;
//   DeliveryAddress? deliveryAddress;
//   List<Item>? items;
//   dynamic storeSubtotal;
//   int? storeTotalItems;
//   List<StatusHistory>? statusHistory;

//   DatumOrder({
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
//     this.storeSubtotal,
//     this.storeTotalItems,
//     this.statusHistory,
//   });

//   factory DatumOrder.fromJson(Map<dynamic, dynamic> json) => DatumOrder(
//         id: json["id"],
//         orderNumber: json["orderNumber"],
//         orderStatus: json["orderStatus"],
//         paymentStatus: json["paymentStatus"],
//         paymentMethod: json["paymentMethod"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//         updatedAt: DateTime?.parse(json["updatedAt"]),
//         customer: Customer.fromJson(json["customer"]),
//         deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         storeSubtotal: json["storeSubtotal"],
//         storeTotalItems: json["storeTotalItems"],
//         statusHistory: List<StatusHistory>.from(
//             json["statusHistory"].map((x) => StatusHistory.fromJson(x))),
//       );

//   Map<dynamic, dynamic> toJson() => {
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
//         "storeSubtotal": storeSubtotal,
//         "storeTotalItems": storeTotalItems,
//         "statusHistory":
//             List<dynamic>.from(statusHistory!.map((x) => x.toJson())),
//       };
// }

// class Customer {
//   dynamic name;
//   dynamic email;
//   dynamic phone;

//   Customer({
//     this.name,
//     this.email,
//     this.phone,
//   });

//   factory Customer.fromJson(Map<dynamic, dynamic> json) => Customer(
//         name: json["name"],
//         email: json["email"],
//         phone: json["phone"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "phone": phone,
//       };
// }

// class DeliveryAddress {
//   dynamic addressLine;
//   dynamic city;
//   dynamic state;
//   dynamic pincode;
//   dynamic phoneNumber;

//   DeliveryAddress({
//     this.addressLine,
//     this.city,
//     this.state,
//     this.pincode,
//     this.phoneNumber,
//   });

//   factory DeliveryAddress.fromJson(Map<dynamic, dynamic> json) =>
//       DeliveryAddress(
//         addressLine: json["addressLine"],
//         city: json["city"],
//         state: json["state"],
//         pincode: json["pincode"],
//         phoneNumber: json["phoneNumber"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "addressLine": addressLine,
//         "city": city,
//         "state": state,
//         "pincode": pincode,
//         "phoneNumber": phoneNumber,
//       };
// }

// class Item {
//   dynamic id;
//   dynamic productName;
//   int? quantity;
//   dynamic price;
//   dynamic originalPrice;
//   dynamic discountAmount;
//   OrderProduct? product;

//   Item({
//     this.id,
//     this.productName,
//     this.quantity,
//     this.price,
//     this.originalPrice,
//     this.discountAmount,
//     this.product,
//   });

//   factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
//         id: json["id"],
//         productName: json["productName"],
//         quantity: json["quantity"],
//         price: json["price"],
//         originalPrice: json["originalPrice"],
//         discountAmount: json["discountAmount"],
//         product: OrderProduct.fromJson(json["product"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "productName": productName,
//         "quantity": quantity,
//         "price": price,
//         "originalPrice": originalPrice,
//         "discountAmount": discountAmount,
//         "product": product!.toJson(),
//       };
// }

// class OrderProduct {
//   dynamic id;
//   dynamic name;
//   dynamic description;

//   OrderProduct({
//     this.id,
//     this.name,
//     this.description,
//   });

//   factory OrderProduct.fromJson(Map<dynamic, dynamic> json) => OrderProduct(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//       };
// }

// class StatusHistory {
//   dynamic status;
//   dynamic comment;
//   DateTime?? createdAt;

//   StatusHistory({
//     this.status,
//     this.comment,
//     this.createdAt,
//   });

//   factory StatusHistory.fromJson(Map<dynamic, dynamic> json) => StatusHistory(
//         status: json["status"],
//         comment: json["comment"],
//         createdAt: DateTime?.parse(json["createdAt"]),
//       );

//   Map<dynamic, dynamic> toJson() => {
//         "status": status,
//         "comment": comment,
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
//     final myOrder = myOrderFromJson(jsondynamic);

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
  dynamic storeTotalItems;
  dynamic originalSubtotal;
  dynamic discountedSubtotal;
  dynamic couponDiscount;
  dynamic subtotalAfterCouponWithoutDelivery;
  dynamic deliveryCharge;
  dynamic finalTotal;
  List<StatusHistory>? statusHistory;
  dynamic totalItems;
  dynamic transactionId;
  dynamic coupon;
  dynamic returnRequest;

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
    this.originalSubtotal,
    this.discountedSubtotal,
    this.couponDiscount,
    this.subtotalAfterCouponWithoutDelivery,
    this.deliveryCharge,
    this.finalTotal,
    this.statusHistory,
    this.totalItems,
    this.transactionId,
    this.coupon,
    this.returnRequest,
  });

  factory DatumOrder.fromJson(Map<dynamic, dynamic> json) => DatumOrder(
        id: json["id"],
        orderNumber: json["orderNumber"],
        orderStatus: json["orderStatus"],
        paymentStatus: json["paymentStatus"],
        paymentMethod: json["paymentMethod"],
        createdAt: DateTime?.parse(json["createdAt"]),
        updatedAt: DateTime?.parse(json["updatedAt"]),
        customer: Customer.fromJson(json["customer"]),
        deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        storeSubtotal: json["storeSubtotal"],
        storeTotalItems: json["storeTotalItems"],
        originalSubtotal: json["originalSubtotal"],
        discountedSubtotal: json["discountedSubtotal"],
        couponDiscount: json["couponDiscount"],
        subtotalAfterCouponWithoutDelivery:
            json["subtotalAfterCouponWithoutDelivery"],
        deliveryCharge: json["deliveryCharge"],
        finalTotal: json["finalTotal"],
        statusHistory: List<StatusHistory>.from(
            json["statusHistory"].map((x) => StatusHistory.fromJson(x))),
        totalItems: json["totalItems"],
        transactionId: json["transactionId"],
        coupon: json["coupon"],
        returnRequest: json["ReturnRequest"],
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
        "originalSubtotal": originalSubtotal,
        "discountedSubtotal": discountedSubtotal,
        "couponDiscount": couponDiscount,
        "subtotalAfterCouponWithoutDelivery":
            subtotalAfterCouponWithoutDelivery,
        "deliveryCharge": deliveryCharge,
        "finalTotal": finalTotal,
        "statusHistory":
            List<dynamic>.from(statusHistory!.map((x) => x.toJson())),
        "totalItems": totalItems,
        "transactionId": transactionId,
        "coupon": coupon,
        "ReturnRequest": returnRequest,
      };
}

class Customer {
  dynamic id;
  dynamic name;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic phone;
  bool? isPhoneVerified;
  bool? isActive;

  Customer({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isPhoneVerified,
    this.isActive,
  });

  factory Customer.fromJson(Map<dynamic, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        isPhoneVerified: json["isPhoneVerified"],
        isActive: json["isActive"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "isPhoneVerified": isPhoneVerified,
        "isActive": isActive,
      };
}

class DeliveryAddress {
  dynamic id;
  dynamic name;
  dynamic phoneNumber;
  dynamic alternatePhoneNumber;
  dynamic addressLine;
  dynamic landmark;
  dynamic city;
  dynamic district;
  dynamic state;
  dynamic country;
  dynamic pincode;
  dynamic addressType;
  bool? isDeliverable;
  bool? isDefault;
  dynamic additionalInstructions;

  DeliveryAddress({
    this.id,
    this.name,
    this.phoneNumber,
    this.alternatePhoneNumber,
    this.addressLine,
    this.landmark,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.addressType,
    this.isDeliverable,
    this.isDefault,
    this.additionalInstructions,
  });

  factory DeliveryAddress.fromJson(Map<dynamic, dynamic> json) =>
      DeliveryAddress(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        alternatePhoneNumber: json["alternatePhoneNumber"],
        addressLine: json["addressLine"],
        landmark: json["landmark"],
        city: json["city"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        addressType: json["addressType"],
        isDeliverable: json["isDeliverable"],
        isDefault: json["isDefault"],
        additionalInstructions: json["additionalInstructions"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "alternatePhoneNumber": alternatePhoneNumber,
        "addressLine": addressLine,
        "landmark": landmark,
        "city": city,
        "district": district,
        "state": state,
        "country": country,
        "pincode": pincode,
        "addressType": addressType,
        "isDeliverable": isDeliverable,
        "isDefault": isDefault,
        "additionalInstructions": additionalInstructions,
      };
}

class Item {
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
  OrderProduct? product;
  Store? store;
  List<dynamic>? orderItemStatusHistory;

  Item({
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
    this.product,
    this.store,
    this.orderItemStatusHistory,
  });

  factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
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
        product: OrderProduct.fromJson(json["product"]),
        store: Store.fromJson(json["store"]),
        orderItemStatusHistory:
            List<dynamic>.from(json["OrderItemStatusHistory"].map((x) => x)),
      );

  Map<dynamic, dynamic> toJson() => {
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
        "product": product!.toJson(),
        "store": store!.toJson(),
        "OrderItemStatusHistory":
            List<dynamic>.from(orderItemStatusHistory!.map((x) => x)),
      };
}

class OrderProduct {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic basePrice;
  dynamic discountPrice;
  int? stock;
  dynamic additionalInfo;
  bool? isActive;
  Category? category;
  dynamic productType;
  List<dynamic>? productTags;
  List<ProductImage>? productImages;
  dynamic timeSlot;
  List<dynamic>? zones;
  List<dynamic>? productHighlight;
  List<dynamic>? productReview;

  OrderProduct({
    this.id,
    this.name,
    this.description,
    this.basePrice,
    this.discountPrice,
    this.stock,
    this.additionalInfo,
    this.isActive,
    this.category,
    this.productType,
    this.productTags,
    this.productImages,
    this.timeSlot,
    this.zones,
    this.productHighlight,
    this.productReview,
  });

  factory OrderProduct.fromJson(Map<dynamic, dynamic> json) => OrderProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        basePrice: json["basePrice"],
        discountPrice: json["discountPrice"],
        stock: json["stock"],
        additionalInfo: json["additionalInfo"],
        isActive: json["isActive"],
        category: Category.fromJson(json["category"]),
        productType: json["productType"],
        productTags: List<dynamic>.from(json["productTags"].map((x) => x)),
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        timeSlot: json["timeSlot"],
        zones: List<dynamic>.from(json["zones"].map((x) => x)),
        productHighlight:
            List<dynamic>.from(json["ProductHighlight"].map((x) => x)),
        productReview: List<dynamic>.from(json["ProductReview"].map((x) => x)),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "basePrice": basePrice,
        "discountPrice": discountPrice,
        "stock": stock,
        "additionalInfo": additionalInfo,
        "isActive": isActive,
        "category": category!.toJson(),
        "productType": productType,
        "productTags": List<dynamic>.from(productTags!.map((x) => x)),
        "productImages":
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "timeSlot": timeSlot,
        "zones": List<dynamic>.from(zones!.map((x) => x)),
        "ProductHighlight": List<dynamic>.from(productHighlight!.map((x) => x)),
        "ProductReview": List<dynamic>.from(productReview!.map((x) => x)),
      };
}

class Category {
  dynamic name;
  dynamic path;
  ParentCategory? parentCategory;

  Category({
    this.name,
    this.path,
    this.parentCategory,
  });

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        name: json["name"],
        path: json["path"],
        parentCategory: ParentCategory.fromJson(json["parentCategory"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "path": path,
        "parentCategory": parentCategory!.toJson(),
      };
}

class ParentCategory {
  dynamic name;
  dynamic id;

  ParentCategory({
    this.name,
    this.id,
  });

  factory ParentCategory.fromJson(Map<dynamic, dynamic> json) => ParentCategory(
        name: json["name"],
        id: json["id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class ProductImage {
  dynamic id;
  dynamic url;
  bool? isDefault;
  dynamic productId;

  ProductImage({
    this.id,
    this.url,
    this.isDefault,
    this.productId,
  });

  factory ProductImage.fromJson(Map<dynamic, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        isDefault: json["isDefault"],
        productId: json["productId"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "url": url,
        "isDefault": isDefault,
        "productId": productId,
      };
}

class Store {
  dynamic id;
  Vendor? vendor;
  OperateDates? operateDates;
  OperateTimes? operateTimes;

  Store({
    this.id,
    this.vendor,
    this.operateDates,
    this.operateTimes,
  });

  factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
        id: json["id"],
        vendor: Vendor.fromJson(json["vendor"]),
        operateDates: OperateDates.fromJson(json["operateDates"]),
        operateTimes: OperateTimes.fromJson(json["operateTimes"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "vendor": vendor!.toJson(),
        "operateDates": operateDates!.toJson(),
        "operateTimes": operateTimes!.toJson(),
      };
}

class OperateDates {
  dynamic id;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  bool? sunday;
  dynamic storeId;

  OperateDates({
    this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.storeId,
  });

  factory OperateDates.fromJson(Map<dynamic, dynamic> json) => OperateDates(
        id: json["id"],
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
        saturday: json["saturday"],
        sunday: json["sunday"],
        storeId: json["storeId"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
        "storeId": storeId,
      };
}

class OperateTimes {
  dynamic id;
  dynamic startTime;
  dynamic endTime;
  dynamic storeId;

  OperateTimes({
    this.id,
    this.startTime,
    this.endTime,
    this.storeId,
  });

  factory OperateTimes.fromJson(Map<dynamic, dynamic> json) => OperateTimes(
        id: json["id"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        storeId: json["storeId"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "startTime": startTime,
        "endTime": endTime,
        "storeId": storeId,
      };
}

class Vendor {
  dynamic id;
  dynamic email;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;
  dynamic role;
  bool? isPhoneVerified;
  dynamic vendorType;
  dynamic businessId;

  Vendor({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.isPhoneVerified,
    this.vendorType,
    this.businessId,
  });

  factory Vendor.fromJson(Map<dynamic, dynamic> json) => Vendor(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        role: json["role"],
        isPhoneVerified: json["isPhoneVerified"],
        vendorType: json["vendorType"],
        businessId: json["businessId"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "role": role,
        "isPhoneVerified": isPhoneVerified,
        "vendorType": vendorType,
        "businessId": businessId,
      };
}

class StatusHistory {
  dynamic id;
  dynamic status;
  dynamic comment;
  dynamic updatedBy;
  DateTime? createdAt;

  StatusHistory({
    this.id,
    this.status,
    this.comment,
    this.updatedBy,
    this.createdAt,
  });

  factory StatusHistory.fromJson(Map<dynamic, dynamic> json) => StatusHistory(
        id: json["id"],
        status: json["status"],
        comment: json["comment"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime?.parse(json["createdAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "status": status,
        "comment": comment,
        "updatedBy": updatedBy,
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
