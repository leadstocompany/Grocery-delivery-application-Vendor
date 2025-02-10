// To parse this JSON data, do
//
//     final uploadMultipleImages = uploadMultipleImagesFromJson(jsonString);

import 'dart:convert';

UploadMultipleImages uploadMultipleImagesFromJson(String str) =>
    UploadMultipleImages.fromJson(json.decode(str));

String uploadMultipleImagesToJson(UploadMultipleImages data) =>
    json.encode(data.toJson());

class UploadMultipleImages {
  int? status;
  String? message;
  List<ImageDatum>? data;

  UploadMultipleImages({
    this.status,
    this.message,
    this.data,
  });

  factory UploadMultipleImages.fromJson(Map<String, dynamic> json) =>
      UploadMultipleImages(
        status: json["status"],
        message: json["message"],
        data: List<ImageDatum>.from(json["data"].map((x) => ImageDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ImageDatum {
  String? url;
  String? publicId;

  ImageDatum({
    this.url,
    this.publicId,
  });

  factory ImageDatum.fromJson(Map<String, dynamic> json) => ImageDatum(
        url: json["url"],
        publicId: json["publicId"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}
