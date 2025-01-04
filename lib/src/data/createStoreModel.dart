// To parse this JSON data, do
//
//     final createStoreModel = createStoreModelFromJson(jsonString);

import 'dart:convert';

CreateStoreModel createStoreModelFromJson(String str) =>
    CreateStoreModel.fromJson(json.decode(str));

String createStoreModelToJson(CreateStoreModel data) =>
    json.encode(data.toJson());

class CreateStoreModel {
  String? id;
  String? storeName;


  CreateStoreModel({
    this.id,
    this.storeName,
  

  });

  factory CreateStoreModel.fromJson(Map<String, dynamic> json) =>
      CreateStoreModel(
        id: json["id"],
        storeName: json["storeName"],
      
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
       
      };
}
