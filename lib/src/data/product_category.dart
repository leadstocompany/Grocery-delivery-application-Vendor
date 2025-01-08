// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  List<Datum>? data;
  Meta? meta;

  CategoryModel({
    this.data,
    this.meta,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Datum {
  String? id;
  String? name;
  Description? description;
  Image? image;
  String? slug;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentCategoryId;
  Datum? parentCategory;
  List<Datum>? childCategories;

  Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.parentCategoryId,
    this.parentCategory,
    this.childCategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: descriptionValues.map[json["description"]],
        image: imageValues.map[json["image"]],
        slug: json["slug"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
        parentCategory: Datum.fromJson(json["parentCategory"]),
        childCategories: List<Datum>.from(
            json["childCategories"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": descriptionValues.reverse[description],
        "image": imageValues.reverse[image],
        "slug": slug,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "parentCategoryId": parentCategoryId,
        "parentCategory": parentCategory!.toJson(),
        "childCategories":
            List<dynamic>.from(childCategories!.map((x) => x.toJson())),
      };
}

enum Description
 {
  ELECTRONIC_PRODUCTS_AND_ACCESSORIES,
  SMART_PHONE_PRODUCTS_AND_ACCESSORIESS,
  XYZ
}

final descriptionValues = EnumValues({
  "Electronic products and accessories":
      Description.ELECTRONIC_PRODUCTS_AND_ACCESSORIES,
  "Smart Phone products and accessoriess":
      Description.SMART_PHONE_PRODUCTS_AND_ACCESSORIESS,
  "xyz": Description.XYZ
});

enum Image { EXAMPLE_COM_IMAGE_JPG, XYSSLJSLJF564534_AFAFA }

final imageValues = EnumValues({
  "example.com/image.jpg": Image.EXAMPLE_COM_IMAGE_JPG,
  "xyssljsljf564534afafa": Image.XYSSLJSLJF564534_AFAFA
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
