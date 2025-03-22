// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsondynamic);

import 'dart:convert';

VendorModel vendorModelFromJson(dynamic str) =>
    VendorModel.fromJson(json.decode(str));

dynamic vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  dynamic id;
  dynamic phone;
  dynamic firstName;
  dynamic lastName;
  dynamic name;
  dynamic role;
  bool? isPhoneVerified;
  dynamic storeId;
  bool? address;

  dynamic img;

  VendorModel(
      {this.id,
      this.phone,
      this.firstName,
      this.lastName,
      this.name,
      this.role,
      this.isPhoneVerified,
      this.storeId,
      this.address,
      this.img
      });

  factory VendorModel.fromJson(Map<dynamic, dynamic> json) => VendorModel(
      id: json["id"],
      phone: json["phone"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      name: json["name"],
      role: json["role"],
      isPhoneVerified: json["isPhoneVerified"],
      storeId: json["storeId"],
      address: json["address"],
      img:json["img"]
      
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "name": name,
        "role": role,
        "isPhoneVerified": isPhoneVerified,
        "storeId": storeId,
        "address": address,
        "img":img
      };
}
