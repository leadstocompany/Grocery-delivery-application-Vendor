// import 'dart:convert';

// PrdouctModel prdouctModelFromJson(String? str) =>
//     PrdouctModel.fromJson(json.decode(str));

// String? prdouctModelToJson(PrdouctModel data) => json.encode(data.toJson());

// class PrdouctModel {
//   List<Poduct>? product;
//   Meta? meta;

//   PrdouctModel({
//     this.product,
//     this.meta,
//   });

//   factory PrdouctModel.fromJson(Map<String?, dynamic> json) => PrdouctModel(
//         product: List<Poduct>.from(json["data"].map((x) => Poduct.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String?, dynamic> toJson() => {
//         "data": List<dynamic>.from(product!.map((x) => x.toJson())),
//         "meta": meta!.toJson(),
//       };
// }

// class Poduct {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   dynamic additionalInfo;
//   dynamic brand;
//   dynamic basePrice;
//   dynamic discountPrice;
//   dynamic stock;
//   dynamic weight;
//   dynamic weightUnit;
//   dynamic minQuantityOrder;
//   dynamic maxQuantityOrder;
//   dynamic slug;
//   dynamic rating;
//   dynamic isInStock;
//   dynamic isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic storeId;
//   dynamic categoryId;
//   dynamic productTypeId;
//   dynamic timeSlotId;
//   Store? store;
//   Category? category;
//   ProductType? productType;
//   TimeSlot? timeSlot;
//   List<ProductImage>? productImages;
//   List<ProductType>? productTags;
//   List<ProductType>? zones;

//   Poduct({
//     this.id,
//     this.name,
//     this.description,
//     this.additionalInfo,
//     this.brand,
//     this.basePrice,
//     this.discountPrice,
//     this.stock,
//     this.weight,
//     this.weightUnit,
//     this.minQuantityOrder,
//     this.maxQuantityOrder,
//     this.slug,
//     this.rating,
//     this.isInStock,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.storeId,
//     this.categoryId,
//     this.productTypeId,
//     this.timeSlotId,
//     this.store,
//     this.category,
//     this.productType,
//     this.timeSlot,
//     this.productImages,
//     this.productTags,
//     this.zones,
//   });

//   factory Poduct.fromJson(Map<String?, dynamic> json) => Poduct(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         additionalInfo: json["additionalInfo"],
//         brand: json["brand"],
//         basePrice: json["basePrice"],
//         discountPrice: json["discountPrice"],
//         stock: json["stock"],
//         weight: json["weight"],
//         weightUnit: json["weightUnit"],
//         minQuantityOrder: json["minQuantityOrder"],
//         maxQuantityOrder: json["maxQuantityOrder"],
//         slug: json["slug"],
//         rating: json["rating"],
//         isInStock: json["isInStock"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         storeId: json["storeId"],
//         categoryId: json["categoryId"],
//         productTypeId: json["productTypeId"],
//         timeSlotId: json["timeSlotId"],
//         store: Store.fromJson(json["store"]),
//         category: Category.fromJson(json["category"]),
//         productType: ProductType.fromJson(json["productType"]),
//         timeSlot: TimeSlot.fromJson(json["timeSlot"]),
//         productImages: List<ProductImage>.from(
//             json["productImages"].map((x) => ProductImage.fromJson(x))),
//         productTags: List<ProductType>.from(
//             json["productTags"].map((x) => ProductType.fromJson(x))),
//         zones: List<ProductType>.from(
//             json["zones"].map((x) => ProductType.fromJson(x))),
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "additionalInfo": additionalInfo,
//         "brand": brand,
//         "basePrice": basePrice,
//         "discountPrice": discountPrice,
//         "stock": stock,
//         "weight": weight,
//         "weightUnit": weightUnit,
//         "minQuantityOrder": minQuantityOrder,
//         "maxQuantityOrder": maxQuantityOrder,
//         "slug": slug,
//         "rating": rating,
//         "isInStock": isInStock,
//         "isActive": isActive,
//         "createdAt": createdAt!.toIso8601String?(),
//         "updatedAt": updatedAt!.toIso8601String?(),
//         "storeId": storeId,
//         "categoryId": categoryId,
//         "productTypeId": productTypeId,
//         "timeSlotId": timeSlotId,
//         "store": store!.toJson(),
//         "category": category!.toJson(),
//         "productType": productType!.toJson(),
//         "timeSlot": timeSlot!.toJson(),
//         "productImages":
//             List<dynamic>.from(productImages!.map((x) => x.toJson())),
//         "productTags": List<dynamic>.from(productTags!.map((x) => x.toJson())),
//         "zones": List<dynamic>.from(zones!.map((x) => x.toJson())),
//       };
// }

// class Category {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   dynamic image;
//   dynamic slug;
//   dynamic isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic parentCategoryId;

//   Category({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.slug,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.parentCategoryId,
//   });

//   factory Category.fromJson(Map<String?, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         slug: json["slug"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         parentCategoryId: json["parentCategoryId"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "image": image,
//         "slug": slug,
//         "isActive": isActive,
//         "createdAt": createdAt!.toIso8601String?(),
//         "updatedAt": updatedAt!.toIso8601String?(),
//         "parentCategoryId": parentCategoryId,
//       };
// }

// class ProductImage {
//   dynamic id;
//   dynamic url;
//   dynamic isDefault;
//   dynamic productId;

//   ProductImage({
//     this.id,
//     this.url,
//     this.isDefault,
//     this.productId,
//   });

//   factory ProductImage.fromJson(Map<String?, dynamic> json) => ProductImage(
//         id: json["id"],
//         url: json["url"],
//         isDefault: json["isDefault"],
//         productId: json["productId"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "isDefault": isDefault,
//         "productId": productId,
//       };
// }

// class ProductType {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   dynamic isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic image;
//   dynamic slug;
//   dynamic deliveryCharges;

//   ProductType({
//     this.id,
//     this.name,
//     this.description,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.slug,
//     this.deliveryCharges,
//   });

//   factory ProductType.fromJson(Map<String?, dynamic> json) => ProductType(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         image: json["image"],
//         slug: json["slug"],
//         deliveryCharges: json["deliveryCharges"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "isActive": isActive,
//         "createdAt": createdAt!.toIso8601String?(),
//         "updatedAt": updatedAt!.toIso8601String?(),
//         "image": image,
//         "slug": slug,
//         "deliveryCharges": deliveryCharges,
//       };
// }

// class Store {
//   dynamic id;
//   dynamic storeName;
//   dynamic storeDescription;
//   dynamic officialPhoneNumber;
//   dynamic storeAddress;
//   dynamic gstNumber;
//   dynamic gumastaNumber;
//   dynamic storePicture;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic vendorId;
//   dynamic isActive;

//   Store({
//     this.id,
//     this.storeName,
//     this.storeDescription,
//     this.officialPhoneNumber,
//     this.storeAddress,
//     this.gstNumber,
//     this.gumastaNumber,
//     this.storePicture,
//     this.createdAt,
//     this.updatedAt,
//     this.vendorId,
//     this.isActive,
//   });

//   factory Store.fromJson(Map<String?, dynamic> json) => Store(
//         id: json["id"],
//         storeName: json["storeName"],
//         storeDescription: json["storeDescription"],
//         officialPhoneNumber: json["officialPhoneNumber"],
//         storeAddress: json["storeAddress"],
//         gstNumber: json["gstNumber"],
//         gumastaNumber: json["gumastaNumber"],
//         storePicture: json["storePicture"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         vendorId: json["vendorId"],
//         isActive: json["isActive"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "storeName": storeName,
//         "storeDescription": storeDescription,
//         "officialPhoneNumber": officialPhoneNumber,
//         "storeAddress": storeAddress,
//         "gstNumber": gstNumber,
//         "gumastaNumber": gumastaNumber,
//         "storePicture": storePicture,
//         "createdAt": createdAt!.toIso8601String?(),
//         "updatedAt": updatedAt!.toIso8601String?(),
//         "vendorId": vendorId,
//         "isActive": isActive,
//       };
// }

// class TimeSlot {
//   dynamic id;
//   dynamic name;
//   DateTime? startTime;
//   DateTime? endTime;
//   dynamic isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   TimeSlot({
//     this.id,
//     this.name,
//     this.startTime,
//     this.endTime,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory TimeSlot.fromJson(Map<String?, dynamic> json) => TimeSlot(
//         id: json["id"],
//         name: json["name"],
//         startTime: DateTime.parse(json["startTime"]),
//         endTime: DateTime.parse(json["endTime"]),
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "startTime": startTime!.toIso8601String?(),
//         "endTime": endTime!.toIso8601String?(),
//         "isActive": isActive,
//         "createdAt": createdAt!.toIso8601String?(),
//         "updatedAt": updatedAt!.toIso8601String?(),
//       };
// }

// class Meta {
//   dynamic total;
//   dynamic page;
//   dynamic lastPage;

//   Meta({
//     this.total,
//     this.page,
//     this.lastPage,
//   });

//   factory Meta.fromJson(Map<String?, dynamic> json) => Meta(
//         total: json["total"],
//         page: json["page"],
//         lastPage: json["lastPage"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "total": total,
//         "page": page,
//         "lastPage": lastPage,
//       };
// }


// To parse this JSON data, do
//
//     final prdouctModel = prdouctModelFromJson(jsonString?);

import 'dart:convert';

PrdouctModel prdouctModelFromJson(String str) => PrdouctModel.fromJson(json.decode(str));

String? prdouctModelToJson(PrdouctModel data) => json.encode(data.toJson());

class PrdouctModel {
    List<Product> ?data;
    Meta? meta;

    PrdouctModel({
        this.data,
        this.meta,
    });

    factory PrdouctModel.fromJson(Map<String?, dynamic> json) => PrdouctModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class Product {
    String? id;
    String? name;
    String? description;
    String? additionalInfo;
    dynamic brand;
    String? basePrice;
    String? discountPrice;
    int? stock;
    int? quantity;
    String? unit;
    String? slug;
    dynamic rating;
    bool? isInStock;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    StoreId? storeId;
    String? categoryId;
    dynamic productTypeId;
    dynamic timeSlotId;
    Store? store;
    Category? category;
    dynamic productType;
    dynamic timeSlot;
    List<ProductImage>? productImages;
    List<dynamic>? productTags;
    List<dynamic>? zones;

    Product({
        this.id,
        this.name,
        this.description,
        this.additionalInfo,
        this.brand,
        this.basePrice,
        this.discountPrice,
        this.stock,
        this.quantity,
        this.unit,
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

    factory Product.fromJson(Map<String?, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        additionalInfo: json["additionalInfo"],
        brand: json["brand"],
        basePrice: json["basePrice"],
        discountPrice: json["discountPrice"],
        stock: json["stock"],
        quantity: json["quantity"],
        unit: json["unit"],
        slug: json["slug"],
        rating: json["rating"],
        isInStock: json["isInStock"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: storeIdValues.map[json["storeId"]],
        categoryId: json["categoryId"],
        productTypeId: json["productTypeId"],
        timeSlotId: json["timeSlotId"],
        store: Store.fromJson(json["store"]),
        category: Category.fromJson(json["category"]),
        productType: json["productType"],
        timeSlot: json["timeSlot"],
        productImages: List<ProductImage>.from(json["productImages"].map((x) => ProductImage.fromJson(x))),
        productTags: List<dynamic>.from(json["productTags"].map((x) => x)),
        zones: List<dynamic>.from(json["zones"].map((x) => x)),
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "additionalInfo": additionalInfo,
        "brand": brand,
        "basePrice": basePrice,
        "discountPrice": discountPrice,
        "stock": stock,
        "quantity": quantity,
        "unit": unit,
        "slug": slug,
        "rating": rating,
        "isInStock": isInStock,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "storeId": storeIdValues.reverse[storeId],
        "categoryId": categoryId,
        "productTypeId": productTypeId,
        "timeSlotId": timeSlotId,
        "store": store!.toJson(),
        "category": category!.toJson(),
        "productType": productType,
        "timeSlot": timeSlot,
        "productImages": List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "productTags": List<dynamic>.from(productTags!.map((x) => x)),
        "zones": List<dynamic>.from(zones!.map((x) => x)),
    };
}

class Category {
    String? id;
    String? name;
    String? description;
    String? image;
    String? slug;
    int? level;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    ParentCategoryId? parentCategoryId;
    String? path;

    Category({
        this.id,
        this.name,
        this.description,
        this.image,
        this.slug,
        this.level,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.parentCategoryId,
        this.path,
    });

    factory Category.fromJson(Map<String?, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        parentCategoryId: parentCategoryIdValues.map[json["parentCategoryId"]],
        path: json["path"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "parentCategoryId": parentCategoryIdValues.reverse[parentCategoryId],
        "path": path,
    };
}

enum ParentCategoryId {
    CM5_RWXEPC000_BZAXV0_JF0_N0_CP,
    CM5_RWXUG5000_DZAXVJLNW4_LPG
}

final parentCategoryIdValues = EnumValues({
    "cm5rwxepc000bzaxv0jf0n0cp": ParentCategoryId.CM5_RWXEPC000_BZAXV0_JF0_N0_CP,
    "cm5rwxug5000dzaxvjlnw4lpg": ParentCategoryId.CM5_RWXUG5000_DZAXVJLNW4_LPG
});

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

    factory ProductImage.fromJson(Map<String?, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        isDefault: json["isDefault"],
        productId: json["productId"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "url": url,
        "isDefault": isDefault,
        "productId": productId,
    };
}

class Store {
    StoreId? id;
    StoreName? storeName;
    StoreDescription? storeDescription;
    String? officialPhoneNumber;
    StoreAddress? storeAddress;
    GstNumber? gstNumber;
    GumastaNumber? gumastaNumber;
    String? storePicture;
    DateTime? createdAt;
    DateTime? updatedAt;
    VendorId? vendorId;
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

    factory Store.fromJson(Map<String?, dynamic> json) => Store(
        id: storeIdValues.map[json["id"]],
        storeName: storeNameValues.map[json["storeName"]],
        storeDescription: storeDescriptionValues.map[json["storeDescription"]],
        officialPhoneNumber: json["officialPhoneNumber"],
        storeAddress: storeAddressValues.map[json["storeAddress"]],
        gstNumber: gstNumberValues.map[json["gstNumber"]],
        gumastaNumber: gumastaNumberValues.map[json["gumastaNumber"]],
        storePicture: json["storePicture"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        vendorId: vendorIdValues.map[json["vendorId"]],
        isActive: json["isActive"],
    );

    Map<String?, dynamic> toJson() => {
        "id": storeIdValues.reverse[id],
        "storeName": storeNameValues.reverse[storeName],
        "storeDescription": storeDescriptionValues.reverse[storeDescription],
        "officialPhoneNumber": officialPhoneNumber,
        "storeAddress": storeAddressValues.reverse[storeAddress],
        "gstNumber": gstNumberValues.reverse[gstNumber],
        "gumastaNumber": gumastaNumberValues.reverse[gumastaNumber],
        "storePicture": storePicture,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "vendorId": vendorIdValues.reverse[vendorId],
        "isActive": isActive,
    };
}

enum GstNumber {
    THE_22_AAAAA00040_A1_Z5,
    THE_22_AAAAA0880_B1_Z5
}

final gstNumberValues = EnumValues({
    "22AAAAA00040A1Z5": GstNumber.THE_22_AAAAA00040_A1_Z5,
    "22AAAAA0880B1Z5": GstNumber.THE_22_AAAAA0880_B1_Z5
});

enum GumastaNumber {
    GUM1423456,
    GUM199466
}

final gumastaNumberValues = EnumValues({
    "GUM1423456": GumastaNumber.GUM1423456,
    "GUM199466": GumastaNumber.GUM199466
});

enum StoreId {
    CM5_RWW4290004_ZAXVA1_ODF9_CD,
    CM5_RYE8_NW000_AINW9_U5_E71_OGW
}

final storeIdValues = EnumValues({
    "cm5rww4290004zaxva1odf9cd": StoreId.CM5_RWW4290004_ZAXVA1_ODF9_CD,
    "cm5rye8nw000ainw9u5e71ogw": StoreId.CM5_RYE8_NW000_AINW9_U5_E71_OGW
});

enum StoreAddress {
    THE_1235_MAIN_STREETS_CITY_STATE_PIN,
    THE_123_MAIN_STREET_C4_ITY_STATE_PIN
}

final storeAddressValues = EnumValues({
    "1235 Main Streets City, State, PIN": StoreAddress.THE_1235_MAIN_STREETS_CITY_STATE_PIN,
    "123 Main Street, C4ity, State, PIN": StoreAddress.THE_123_MAIN_STREET_C4_ITY_STATE_PIN
});

enum StoreDescription {
    A_CLOTH_SHOP_OSSFFERING_CLOTH,
    A_GROCERY_STORE_OFFERING_FRESH_PRODUCE_EAND_DAILY_ESSENTIALS
}

final storeDescriptionValues = EnumValues({
    "A cloth shop ossffering cloth": StoreDescription.A_CLOTH_SHOP_OSSFFERING_CLOTH,
    "A grocery store offering fresh produce eand daily essentials": StoreDescription.A_GROCERY_STORE_OFFERING_FRESH_PRODUCE_EAND_DAILY_ESSENTIALS
});

enum StoreName {
    KOLKATA_MARKET,
    SUPER_MARKET1
}

final storeNameValues = EnumValues({
    "Kolkata Market": StoreName.KOLKATA_MARKET,
    "Super Market1": StoreName.SUPER_MARKET1
});

enum VendorId {
    CM5_RWUM1_A0001_ZAXV2_QF6_UC0_G,
    CM5_RYCUV80007_INW9_PZCRN3_EB
}

final vendorIdValues = EnumValues({
    "cm5rwum1a0001zaxv2qf6uc0g": VendorId.CM5_RWUM1_A0001_ZAXV2_QF6_UC0_G,
    "cm5rycuv80007inw9pzcrn3eb": VendorId.CM5_RYCUV80007_INW9_PZCRN3_EB
});

class Meta {
    int? total;
    int? page;
    int? lastPage;

    Meta({
        this.total,
        this.page,
        this.lastPage,
    });

    factory Meta.fromJson(Map<String?, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
    );

    Map<String?, dynamic> toJson() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
    };
}

class EnumValues<T> {
    Map<String?, T> map;
    late Map<T, String?> reverseMap;

    EnumValues(this.map);

    Map<T, String?> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

