// import 'dart:convert';

// PrdouctModel prdouctModelFromJson(dynamic str) =>
//     PrdouctModel.fromJson(json.decode(str));

// dynamic? prdouctModelToJson(PrdouctModel data) => json.encode(data.toJson());

// class PrdouctModel {
//   List<Product>? data;
//   Meta? meta;

//   PrdouctModel({
//     this.data,
//     this.meta,
//   });

//   factory PrdouctModel.fromJson(Map<dynamic?, dynamic> json) => PrdouctModel(
//         data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<dynamic?, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "meta": meta!.toJson(),
//       };
// }

// class Product {
//   dynamic? id;
//   dynamic? name;
//   dynamic? description;
//   dynamic? additionalInfo;
//   dynamic brand;
//   dynamic? basePrice;
//   dynamic? discountPrice;
//   int? stock;
//   int? quantity;
//   dynamic? unit;
//   dynamic? slug;
//   dynamic rating;
//   bool? isInStock;
//   bool? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   StoreId? storeId;
//   dynamic? categoryId;
//   dynamic productTypeId;
//   dynamic timeSlotId;
//   Store? store;
//   Category? category;
//   dynamic productType;
//   dynamic timeSlot;
//   List<ProductImage>? productImages;
//   List<dynamic>? productTags;
//   List<dynamic>? zones;

//   Product({
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

//   factory Product.fromJson(Map<dynamic?, dynamic> json) => Product(
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
//         rating: json["rating"],
//         isInStock: json["isInStock"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         storeId: storeIdValues.map[json["storeId"]],
//         categoryId: json["categoryId"],
//         productTypeId: json["productTypeId"],
//         timeSlotId: json["timeSlotId"],
//         store: Store.fromJson(json["store"]),
//         category: Category.fromJson(json["category"]),
//         productType: json["productType"],
//         timeSlot: json["timeSlot"],
//         productImages: List<ProductImage>.from(
//             json["productImages"].map((x) => ProductImage.fromJson(x))),
//         productTags: List<dynamic>.from(json["productTags"].map((x) => x)),
//         zones: List<dynamic>.from(json["zones"].map((x) => x)),
//       );

//   Map<dynamic?, dynamic> toJson() => {
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
//         "rating": rating,
//         "isInStock": isInStock,
//         "isActive": isActive,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "storeId": storeIdValues.reverse[storeId],
//         "categoryId": categoryId,
//         "productTypeId": productTypeId,
//         "timeSlotId": timeSlotId,
//         "store": store!.toJson(),
//         "category": category!.toJson(),
//         "productType": productType,
//         "timeSlot": timeSlot,
//         "productImages":
//             List<dynamic>.from(productImages!.map((x) => x.toJson())),
//         "productTags": List<dynamic>.from(productTags!.map((x) => x)),
//         "zones": List<dynamic>.from(zones!.map((x) => x)),
//       };
// }

// class Category {
//   dynamic? id;
//   dynamic? name;
//   dynamic? description;
//   dynamic? image;
//   dynamic? slug;
//   int? level;
//   bool? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   ParentCategoryId? parentCategoryId;
//   dynamic? path;

//   Category({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.slug,
//     this.level,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.parentCategoryId,
//     this.path,
//   });

//   factory Category.fromJson(Map<dynamic?, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         slug: json["slug"],
//         level: json["level"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         parentCategoryId: parentCategoryIdValues.map[json["parentCategoryId"]],
//         path: json["path"],
//       );

//   Map<dynamic?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "image": image,
//         "slug": slug,
//         "level": level,
//         "isActive": isActive,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "parentCategoryId": parentCategoryIdValues.reverse[parentCategoryId],
//         "path": path,
//       };
// }

// enum ParentCategoryId {
//   CM5_RWXEPC000_BZAXV0_JF0_N0_CP,
//   CM5_RWXUG5000_DZAXVJLNW4_LPG
// }

// final parentCategoryIdValues = EnumValues({
//   "cm5rwxepc000bzaxv0jf0n0cp": ParentCategoryId.CM5_RWXEPC000_BZAXV0_JF0_N0_CP,
//   "cm5rwxug5000dzaxvjlnw4lpg": ParentCategoryId.CM5_RWXUG5000_DZAXVJLNW4_LPG
// });

// class ProductImage {
//   dynamic? id;
//   dynamic? url;
//   bool? isDefault;
//   dynamic? productId;

//   ProductImage({
//     this.id,
//     this.url,
//     this.isDefault,
//     this.productId,
//   });

//   factory ProductImage.fromJson(Map<dynamic?, dynamic> json) => ProductImage(
//         id: json["id"],
//         url: json["url"],
//         isDefault: json["isDefault"],
//         productId: json["productId"],
//       );

//   Map<dynamic?, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "isDefault": isDefault,
//         "productId": productId,
//       };
// }

// class Store {
//   StoreId? id;
//   StoreName? storeName;
//   StoreDescription? storeDescription;
//   dynamic? officialPhoneNumber;
//   StoreAddress? storeAddress;
//   GstNumber? gstNumber;
//   GumastaNumber? gumastaNumber;
//   dynamic? storePicture;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   VendorId? vendorId;
//   bool? isActive;

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

//   factory Store.fromJson(Map<dynamic?, dynamic> json) => Store(
//         id: storeIdValues.map[json["id"]],
//         storeName: storeNameValues.map[json["storeName"]],
//         storeDescription: storeDescriptionValues.map[json["storeDescription"]],
//         officialPhoneNumber: json["officialPhoneNumber"],
//         storeAddress: storeAddressValues.map[json["storeAddress"]],
//         gstNumber: gstNumberValues.map[json["gstNumber"]],
//         gumastaNumber: gumastaNumberValues.map[json["gumastaNumber"]],
//         storePicture: json["storePicture"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         vendorId: vendorIdValues.map[json["vendorId"]],
//         isActive: json["isActive"],
//       );

//   Map<dynamic?, dynamic> toJson() => {
//         "id": storeIdValues.reverse[id],
//         "storeName": storeNameValues.reverse[storeName],
//         "storeDescription": storeDescriptionValues.reverse[storeDescription],
//         "officialPhoneNumber": officialPhoneNumber,
//         "storeAddress": storeAddressValues.reverse[storeAddress],
//         "gstNumber": gstNumberValues.reverse[gstNumber],
//         "gumastaNumber": gumastaNumberValues.reverse[gumastaNumber],
//         "storePicture": storePicture,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "vendorId": vendorIdValues.reverse[vendorId],
//         "isActive": isActive,
//       };
// }

// enum GstNumber { THE_22_AAAAA00040_A1_Z5, THE_22_AAAAA0880_B1_Z5 }

// final gstNumberValues = EnumValues({
//   "22AAAAA00040A1Z5": GstNumber.THE_22_AAAAA00040_A1_Z5,
//   "22AAAAA0880B1Z5": GstNumber.THE_22_AAAAA0880_B1_Z5
// });

// enum GumastaNumber { GUM1423456, GUM199466 }

// final gumastaNumberValues = EnumValues({
//   "GUM1423456": GumastaNumber.GUM1423456,
//   "GUM199466": GumastaNumber.GUM199466
// });

// enum StoreId { CM5_RWW4290004_ZAXVA1_ODF9_CD, CM5_RYE8_NW000_AINW9_U5_E71_OGW }

// final storeIdValues = EnumValues({
//   "cm5rww4290004zaxva1odf9cd": StoreId.CM5_RWW4290004_ZAXVA1_ODF9_CD,
//   "cm5rye8nw000ainw9u5e71ogw": StoreId.CM5_RYE8_NW000_AINW9_U5_E71_OGW
// });

// enum StoreAddress {
//   THE_1235_MAIN_STREETS_CITY_STATE_PIN,
//   THE_123_MAIN_STREET_C4_ITY_STATE_PIN
// }

// final storeAddressValues = EnumValues({
//   "1235 Main Streets City, State, PIN":
//       StoreAddress.THE_1235_MAIN_STREETS_CITY_STATE_PIN,
//   "123 Main Street, C4ity, State, PIN":
//       StoreAddress.THE_123_MAIN_STREET_C4_ITY_STATE_PIN
// });

// enum StoreDescription {
//   A_CLOTH_SHOP_OSSFFERING_CLOTH,
//   A_GROCERY_STORE_OFFERING_FRESH_PRODUCE_EAND_DAILY_ESSENTIALS
// }

// final storeDescriptionValues = EnumValues({
//   "A cloth shop ossffering cloth":
//       StoreDescription.A_CLOTH_SHOP_OSSFFERING_CLOTH,
//   "A grocery store offering fresh produce eand daily essentials":
//       StoreDescription
//           .A_GROCERY_STORE_OFFERING_FRESH_PRODUCE_EAND_DAILY_ESSENTIALS
// });

// enum StoreName { KOLKATA_MARKET, SUPER_MARKET1 }

// final storeNameValues = EnumValues({
//   "Kolkata Market": StoreName.KOLKATA_MARKET,
//   "Super Market1": StoreName.SUPER_MARKET1
// });

// enum VendorId { CM5_RWUM1_A0001_ZAXV2_QF6_UC0_G, CM5_RYCUV80007_INW9_PZCRN3_EB }

// final vendorIdValues = EnumValues({
//   "cm5rwum1a0001zaxv2qf6uc0g": VendorId.CM5_RWUM1_A0001_ZAXV2_QF6_UC0_G,
//   "cm5rycuv80007inw9pzcrn3eb": VendorId.CM5_RYCUV80007_INW9_PZCRN3_EB
// });

// class Meta {
//   int? total;
//   int? page;
//   int? lastPage;

//   Meta({
//     this.total,
//     this.page,
//     this.lastPage,
//   });

//   factory Meta.fromJson(Map<dynamic?, dynamic> json) => Meta(
//         total: json["total"],
//         page: json["page"],
//         lastPage: json["lastPage"],
//       );

//   Map<dynamic?, dynamic> toJson() => {
//         "total": total,
//         "page": page,
//         "lastPage": lastPage,
//       };
// }

// class EnumValues<T> {
//   Map<dynamic?, T> map;
//   late Map<T, dynamic?> reverseMap;

//   EnumValues(this.map);

//   Map<T, dynamic?> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }



import 'dart:convert';

PrdouctModel prdouctModelFromJson(dynamic str) =>
    PrdouctModel.fromJson(json.decode(str));

dynamic prdouctModelToJson(PrdouctModel data) => json.encode(data.toJson());

class PrdouctModel {
  List<Product>? data;
  Meta? meta;

  PrdouctModel({
    this.data,
    this.meta,
  });

  factory PrdouctModel.fromJson(Map<dynamic, dynamic> json) => PrdouctModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Product {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic additionalInfo;
  dynamic brand;
  dynamic basePrice;
  dynamic discountPrice;
  dynamic stock;
  dynamic quantity;
  dynamic unit;
  dynamic slug;
  dynamic averageRating;
  dynamic isInStock;
  dynamic isActive;
  dynamic disclaimer;
  dynamic customerCareDetails;
  dynamic manufacturerName;
  dynamic manufacturerAddress;
  dynamic countryOfOrigin;
  dynamic expiryDate;
  dynamic returnsAllowedDays;
  dynamic exchangeAllowedDays;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic storeId;
  dynamic categoryId;
  dynamic productTypeId;
  dynamic timeSlotId;
  Store? store;
  Category? category;
  dynamic productType;
  dynamic timeSlot;
  List<ProductImage>? productImages;
  List<dynamic>? productTags;
  List<dynamic>? zones;
  List<dynamic>? productHighlight;
  List<dynamic>? productReview;
  List<dynamic>? questions;
  List<dynamic>? cartItems;
  List<dynamic>? wishlistItem;
  List<dynamic>? applicableCoupons;

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
    this.averageRating,
    this.isInStock,
    this.isActive,
    this.disclaimer,
    this.customerCareDetails,
    this.manufacturerName,
    this.manufacturerAddress,
    this.countryOfOrigin,
    this.expiryDate,
    this.returnsAllowedDays,
    this.exchangeAllowedDays,
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
    this.productHighlight,
    this.productReview,
    this.questions,
    this.cartItems,
    this.wishlistItem,
    this.applicableCoupons,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
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
        averageRating: json["averageRating"],
        isInStock: json["isInStock"],
        isActive: json["isActive"],
        disclaimer: json["disclaimer"],
        customerCareDetails: json["customerCareDetails"],
        manufacturerName: json["manufacturerName"],
        manufacturerAddress: json["manufacturerAddress"],
        countryOfOrigin: json["countryOfOrigin"],
        expiryDate: json["expiryDate"],
        returnsAllowedDays: json["returnsAllowedDays"],
        exchangeAllowedDays: json["exchangeAllowedDays"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        categoryId: json["categoryId"],
        productTypeId: json["productTypeId"],
        timeSlotId: json["timeSlotId"],
        store: Store.fromJson(json["store"]),
        category: Category.fromJson(json["category"]),
        productType: json["productType"],
        timeSlot: json["timeSlot"],
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        productTags: List<dynamic>.from(json["productTags"].map((x) => x)),
        zones: List<dynamic>.from(json["zones"].map((x) => x)),
        productHighlight:
            List<dynamic>.from(json["ProductHighlight"].map((x) => x)),
        productReview: List<dynamic>.from(json["ProductReview"].map((x) => x)),
        questions: List<dynamic>.from(json["questions"].map((x) => x)),
        cartItems: List<dynamic>.from(json["cartItems"].map((x) => x)),
        wishlistItem: List<dynamic>.from(json["WishlistItem"].map((x) => x)),
        applicableCoupons:
            List<dynamic>.from(json["applicableCoupons"].map((x) => x)),
      );

  Map<dynamic, dynamic> toJson() => {
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
        "averageRating": averageRating,
        "isInStock": isInStock,
        "isActive": isActive,
        "disclaimer": disclaimer,
        "customerCareDetails": customerCareDetails,
        "manufacturerName": manufacturerName,
        "manufacturerAddress": manufacturerAddress,
        "countryOfOrigin": countryOfOrigin,
        "expiryDate": expiryDate,
        "returnsAllowedDays": returnsAllowedDays,
        "exchangeAllowedDays": exchangeAllowedDays,
        "createdAt": createdAt.toIso8601dynamic(),
        "updatedAt": updatedAt.toIso8601dynamic(),
        "storeId": storeId,
        "categoryId": categoryId,
        "productTypeId": productTypeId,
        "timeSlotId": timeSlotId,
        "store": store!.toJson(),
        "category": category!.toJson(),
        "productType": productType,
        "timeSlot": timeSlot,
        "productImages":
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "productTags": List<dynamic>.from(productTags!.map((x) => x)),
        "zones": List<dynamic>.from(zones!.map((x) => x)),
        "ProductHighlight": List<dynamic>.from(productHighlight!.map((x) => x)),
        "ProductReview": List<dynamic>.from(productReview!.map((x) => x)),
        "questions": List<dynamic>.from(questions!.map((x) => x)),
        "cartItems": List<dynamic>.from(cartItems!.map((x) => x)),
        "WishlistItem": List<dynamic>.from(wishlistItem!.map((x) => x)),
        "applicableCoupons":
            List<dynamic>.from(applicableCoupons!.map((x) => x)),
      };
}

class Category {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic slug;
  dynamic level;
  dynamic isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic commissionPercentage;
  dynamic parentCategoryId;
  dynamic path;

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
    this.commissionPercentage,
    this.parentCategoryId,
    this.path,
  });

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        commissionPercentage: json["commissionPercentage"],
        parentCategoryId: json["parentCategoryId"],
        path: json["path"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601dynamic(),
        "updatedAt": updatedAt.toIso8601dynamic(),
        "commissionPercentage": commissionPercentage,
        "parentCategoryId": parentCategoryId,
        "path": path,
      };
}

class ProductImage {
  dynamic id;
  dynamic url;
  dynamic isDefault;
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
  dynamic storeName;
  dynamic storePicture;
  dynamic storeAddress;
  dynamic officialPhoneNumber;
  dynamic sellerLicenseNumber;
  Vendor? vendor;

  Store({
    this.id,
    this.storeName,
    this.storePicture,
    this.storeAddress,
    this.officialPhoneNumber,
    this.sellerLicenseNumber,
    this.vendor,
  });

  factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
        id: json["id"],
        storeName: json["storeName"],
        storePicture: json["storePicture"],
        storeAddress: json["storeAddress"],
        officialPhoneNumber: json["officialPhoneNumber"],
        sellerLicenseNumber: json["sellerLicenseNumber"],
        vendor: Vendor.fromJson(json["vendor"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "storePicture": storePicture,
        "storeAddress": storeAddress,
        "officialPhoneNumber": officialPhoneNumber,
        "sellerLicenseNumber": sellerLicenseNumber,
        "vendor": vendor!.toJson(),
      };
}

class Vendor {
  dynamic id;
  dynamic email;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;

  Vendor({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory Vendor.fromJson(Map<dynamic, dynamic> json) => Vendor(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
      };
}

class Meta {
  dynamic total;
  dynamic page;
  dynamic lastPage;

  Meta({
    this.total,
    this.page,
    this.lastPage,
  });

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
      );

  Map<dynamic, dynamic> toJson() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
      };
}
