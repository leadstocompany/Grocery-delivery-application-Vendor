// // To parse this JSON data, do
// //
// //     final productCategoryModel = productCategoryModelFromJson(jsondynamic);

// import 'dart:convert';

// List<ProductCategoryModel> productCategoryModelFromJson(dynamic str) => List<ProductCategoryModel>.from(json.decode(str).map((x) => ProductCategoryModel.fromJson(x)));

// dynamic productCategoryModelToJson(List<ProductCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductCategoryModel 
// {
//     dynamic id;
//     dynamic name;
//     dynamic description;
//     dynamic image;
//     dynamic slug;
//     dynamic level;
//     bool? isActive;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic parentCategoryId;
//     dynamic path;
//     dynamic parentCategory;
//     List<ProductCategoryModel>? childCategories;

//     ProductCategoryModel({
//         this.id,
//         this.name,
//         this.description,
//         this.image,
//         this.slug,
//         this.level,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt,
//         this.parentCategoryId,
//         this.path,
//         this.parentCategory,
//         this.childCategories,
//     });

//     factory ProductCategoryModel.fromJson(Map<dynamic, dynamic> json) => ProductCategoryModel(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         slug: json["slug"],
//         level: json["level"],
//         isActive: json["isActive"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         parentCategoryId: json["parentCategoryId"],
//         path: json["path"],
//         parentCategory: json["parentCategory"],
//         childCategories: List<ProductCategoryModel>.from(json["childCategories"].map((x) => ProductCategoryModel.fromJson(x))),
//     );

//     Map<dynamic, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "image": image,
//         "slug": slug,
//         "level": level,
//         "isActive": isActive,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "parentCategoryId": parentCategoryId,
//         "path": path,
//         "parentCategory": parentCategory,
//         "childCategories": List<dynamic>.from(childCategories!.map((x) => x.toJson())),
//     };
// }

import 'dart:convert';

List<ProductCategoryModel> productCategoryModelFromJson(String str) =>
    List<ProductCategoryModel>.from(
        json.decode(str).map((x) => ProductCategoryModel.fromJson(x)));

String productCategoryModelToJson(List<ProductCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategoryModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? slug;
  int? level;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? parentCategoryId;
  String? path;
  ProductCategoryModel? parentCategory;
  List<ProductCategoryModel>? childCategories;

  ProductCategoryModel({
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
    this.parentCategory,
    this.childCategories,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
        path: json["path"],
        parentCategory: json["parentCategory"] == null
            ? null
            : ProductCategoryModel.fromJson(json["parentCategory"]),
        childCategories: json["childCategories"] == null
            ? []
            : List<ProductCategoryModel>.from(json["childCategories"]
                .map((x) => ProductCategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parentCategoryId": parentCategoryId,
        "path": path,
        "parentCategory": parentCategory?.toJson(),
        "childCategories": childCategories == null
            ? []
            : List<dynamic>.from(childCategories!.map((x) => x.toJson())),
      };
}
