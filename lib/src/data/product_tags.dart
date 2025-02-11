// To parse this JSON data, do
//
//     final productTagsModel = productTagsModelFromJson(jsondynamic);

import 'dart:convert';

ProductTagsModel productTagsModelFromJson(dynamic str) =>
    ProductTagsModel.fromJson(json.decode(str));

dynamic productTagsModelToJson(ProductTagsModel data) =>
    json.encode(data.toJson());

class ProductTagsModel {
  List<DatumTags>? data;
  Meta? meta;

  ProductTagsModel({
    this.data,
    this.meta,
  });

  factory ProductTagsModel.fromJson(Map<dynamic, dynamic> json) =>
      ProductTagsModel(
        data: List<DatumTags>.from(
            json["data"].map((x) => DatumTags.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class DatumTags {
  dynamic id;
  dynamic name;
  dynamic description;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumTags({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory DatumTags.fromJson(Map<dynamic, dynamic> json) => DatumTags(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
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
