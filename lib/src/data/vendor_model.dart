// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

VendorModel vendorModelFromJson(String str) =>
    VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  String? id;
  String? phone;
  String? role;
  bool? isPhoneVerified;
  String? storeId;

  VendorModel({
    this.id,
    this.phone,
    this.role,
    this.isPhoneVerified,
    this.storeId,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json["id"],
        phone: json["phone"],
        role: json["role"],
        isPhoneVerified: json["isPhoneVerified"],
        storeId: json["storeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "role": role,
        "isPhoneVerified": isPhoneVerified,
        "storeId": storeId,
      };
}
