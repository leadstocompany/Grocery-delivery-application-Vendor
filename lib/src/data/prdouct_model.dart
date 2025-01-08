

import 'dart:convert';

PrdouctModel prdouctModelFromJson(String str) =>
    PrdouctModel.fromJson(json.decode(str));

String prdouctModelToJson(PrdouctModel data) => json.encode(data.toJson());

class PrdouctModel {
  List<Poduct>? product;
  Meta? meta;

  PrdouctModel({
    this.product,
    this.meta,
  });

  factory PrdouctModel.fromJson(Map<String, dynamic> json) => PrdouctModel(
        product: List<Poduct>.from(json["data"].map((x) => Poduct.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(product!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Poduct {
  String? id;
  String? name;
  String? description;
  String? additionalInfo;
  String? brand;
  String? basePrice;
  String? discountPrice;
  int? stock;
  String? weight;
  String? weightUnit;
  int? minQuantityOrder;
  int? maxQuantityOrder;
  String? slug;
  String? rating;
  bool? isInStock;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? storeId;
  String? categoryId;
  String? productTypeId;
  String? timeSlotId;
  Store? store;
  Category? category;
  ProductType? productType;
  TimeSlot? timeSlot;
  List<ProductImage>? productImages;
  List<ProductType>? productTags;
  List<ProductType>? zones;

  Poduct({
    this.id,
    this.name,
    this.description,
    this.additionalInfo,
    this.brand,
    this.basePrice,
    this.discountPrice,
    this.stock,
    this.weight,
    this.weightUnit,
    this.minQuantityOrder,
    this.maxQuantityOrder,
    this.slug,
    this.rating,
    this.isInStock,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.storeId,
    this.categoryId,
    this.productTypeId,
    this.timeSlotId,
    this.store,
    this.category,
    this.productType,
    this.timeSlot,
    this.productImages,
    this.productTags,
    this.zones,
  });

  factory Poduct.fromJson(Map<String, dynamic> json) => Poduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        additionalInfo: json["additionalInfo"],
        brand: json["brand"],
        basePrice: json["basePrice"],
        discountPrice: json["discountPrice"],
        stock: json["stock"],
        weight: json["weight"],
        weightUnit: json["weightUnit"],
        minQuantityOrder: json["minQuantityOrder"],
        maxQuantityOrder: json["maxQuantityOrder"],
        slug: json["slug"],
        rating: json["rating"],
        isInStock: json["isInStock"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        categoryId: json["categoryId"],
        productTypeId: json["productTypeId"],
        timeSlotId: json["timeSlotId"],
        store: Store.fromJson(json["store"]),
        category: Category.fromJson(json["category"]),
        productType: ProductType.fromJson(json["productType"]),
        timeSlot: TimeSlot.fromJson(json["timeSlot"]),
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        productTags: List<ProductType>.from(
            json["productTags"].map((x) => ProductType.fromJson(x))),
        zones: List<ProductType>.from(
            json["zones"].map((x) => ProductType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "additionalInfo": additionalInfo,
        "brand": brand,
        "basePrice": basePrice,
        "discountPrice": discountPrice,
        "stock": stock,
        "weight": weight,
        "weightUnit": weightUnit,
        "minQuantityOrder": minQuantityOrder,
        "maxQuantityOrder": maxQuantityOrder,
        "slug": slug,
        "rating": rating,
        "isInStock": isInStock,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "storeId": storeId,
        "categoryId": categoryId,
        "productTypeId": productTypeId,
        "timeSlotId": timeSlotId,
        "store": store!.toJson(),
        "category": category!.toJson(),
        "productType": productType!.toJson(),
        "timeSlot": timeSlot!.toJson(),
        "productImages":
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "productTags": List<dynamic>.from(productTags!.map((x) => x.toJson())),
        "zones": List<dynamic>.from(zones!.map((x) => x.toJson())),
      };
}

class Category {
  String? id;
  String? name;
  String? description;
  String? image;
  String? slug;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentCategoryId;

  Category({
    this.id,
    this.name,
    this.description,
    this.image,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.parentCategoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "parentCategoryId": parentCategoryId,
      };
}

class ProductImage {
  String? id;
  String? url;
  bool? isDefault;
  String? productId;

  ProductImage({
    this.id,
    this.url,
    this.isDefault,
    this.productId,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        isDefault: json["isDefault"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "isDefault": isDefault,
        "productId": productId,
      };
}

class ProductType {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? slug;
  String? deliveryCharges;

  ProductType({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.slug,
    this.deliveryCharges,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        image: json["image"],
        slug: json["slug"],
        deliveryCharges: json["deliveryCharges"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "image": image,
        "slug": slug,
        "deliveryCharges": deliveryCharges,
      };
}

class Store {
  String? id;
  String? storeName;
  String? storeDescription;
  String? officialPhoneNumber;
  String? storeAddress;
  String? gstNumber;
  String? gumastaNumber;
  String? storePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? vendorId;
  bool? isActive;

  Store({
    this.id,
    this.storeName,
    this.storeDescription,
    this.officialPhoneNumber,
    this.storeAddress,
    this.gstNumber,
    this.gumastaNumber,
    this.storePicture,
    this.createdAt,
    this.updatedAt,
    this.vendorId,
    this.isActive,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        storeName: json["storeName"],
        storeDescription: json["storeDescription"],
        officialPhoneNumber: json["officialPhoneNumber"],
        storeAddress: json["storeAddress"],
        gstNumber: json["gstNumber"],
        gumastaNumber: json["gumastaNumber"],
        storePicture: json["storePicture"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        vendorId: json["vendorId"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "storeDescription": storeDescription,
        "officialPhoneNumber": officialPhoneNumber,
        "storeAddress": storeAddress,
        "gstNumber": gstNumber,
        "gumastaNumber": gumastaNumber,
        "storePicture": storePicture,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "vendorId": vendorId,
        "isActive": isActive,
      };
}

class TimeSlot {
  String? id;
  String? name;
  DateTime? startTime;
  DateTime? endTime;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  TimeSlot({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        id: json["id"],
        name: json["name"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startTime": startTime!.toIso8601String(),
        "endTime": endTime!.toIso8601String(),
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Meta {
  int? total;
  int? page;
  int? lastPage;

  Meta({
    this.total,
    this.page,
    this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
      };
}
