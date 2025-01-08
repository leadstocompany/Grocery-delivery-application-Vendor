// To parse this JSON data, do
//
//     final passwordModel = passwordModelFromJson(jsonString);

import 'dart:convert';

PasswordModel passwordModelFromJson(String str) =>
    PasswordModel.fromJson(json.decode(str));

String passwordModelToJson(PasswordModel data) => json.encode(data.toJson());

class PasswordModel {
  String? message;
  Data? data;

  PasswordModel({
    this.message,
    this.data,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) => PasswordModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  String?resetToken;

  Data({
    this.resetToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        resetToken: json["resetToken"],
      );

  Map<String, dynamic> toJson() => {
        "resetToken": resetToken,
      };
}
