// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsondynamic?);

import 'dart:convert';

StoreModel storeModelFromJson(dynamic str) =>
    StoreModel.fromJson(json.decode(str));

dynamic storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel 
{
  dynamic? id;
  dynamic? storeName;
  dynamic? storeDescription;
  dynamic? officialPhoneNumber;
  dynamic? storeAddress;
  dynamic? gstNumber;
  dynamic? gumastaNumber;
  dynamic? storePicture;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? vendorId;
  bool? isActive;
  OperateDates? operateDates;
  OperateTimes? operateTimes;
  PaymentDetails? paymentDetails;

  StoreModel({
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
    this.operateDates,
    this.operateTimes,
    this.paymentDetails,
  });

  factory StoreModel.fromJson(Map<dynamic?, dynamic> json) => StoreModel(
        id: json["id"],
        storeName: json["storeName"],
        storeDescription: json["storeDescription"],
        officialPhoneNumber: json["officialPhoneNumber"],
        storeAddress: json["storeAddress"],
        gstNumber: json["gstNumber"],
        gumastaNumber: json["gumastaNumber"],
        storePicture: json["storePicture"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        vendorId: json["vendorId"],
        isActive: json["isActive"],
        operateDates: OperateDates.fromJson(json["operateDates"]),
        operateTimes: OperateTimes.fromJson(json["operateTimes"]),
        paymentDetails: PaymentDetails.fromJson(json["paymentDetails"]),
      );

  Map<dynamic?, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "storeDescription": storeDescription,
        "officialPhoneNumber": officialPhoneNumber,
        "storeAddress": storeAddress,
        "gstNumber": gstNumber,
        "gumastaNumber": gumastaNumber,
        "storePicture": storePicture,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "vendorId": vendorId,
        "isActive": isActive,
        "operateDates": operateDates!.toJson(),
        "operateTimes": operateTimes!.toJson(),
        "paymentDetails": paymentDetails!.toJson(),
      };
}

class OperateDates {
  dynamic? id;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  bool? sunday;
  dynamic? storeId;

  OperateDates({
    this.id,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.storeId,
  });

  factory OperateDates.fromJson(Map<dynamic?, dynamic> json) => OperateDates(
        id: json["id"],
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
        saturday: json["saturday"],
        sunday: json["sunday"],
        storeId: json["storeId"],
      );

  Map<dynamic?, dynamic> toJson() => {
        "id": id,
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
        "storeId": storeId,
      };
}

class OperateTimes {
  dynamic? id;
  dynamic? startTime;
  dynamic? endTime;
  dynamic? storeId;

  OperateTimes({
    this.id,
    this.startTime,
    this.endTime,
    this.storeId,
  });

  factory OperateTimes.fromJson(Map<dynamic?, dynamic> json) => OperateTimes(
        id: json["id"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        storeId: json["storeId"],
      );

  Map<dynamic?, dynamic> toJson() => {
        "id": id,
        "startTime": startTime,
        "endTime": endTime,
        "storeId": storeId,
      };
}

class PaymentDetails {
  dynamic? id;
  dynamic? bankName;
  dynamic? accountHolder;
  dynamic? accountNumber;
  dynamic? ifscCode;
  dynamic? appWithdrawalPin;
  bool? isVerified;
  dynamic? storeId;

  PaymentDetails({
    this.id,
    this.bankName,
    this.accountHolder,
    this.accountNumber,
    this.ifscCode,
    this.appWithdrawalPin,
    this.isVerified,
    this.storeId,
  });

  factory PaymentDetails.fromJson(Map<dynamic?, dynamic> json) => PaymentDetails(
        id: json["id"],
        bankName: json["bankName"],
        accountHolder: json["accountHolder"],
        accountNumber: json["accountNumber"],
        ifscCode: json["ifscCode"],
        appWithdrawalPin: json["appWithdrawalPin"],
        isVerified: json["isVerified"],
        storeId: json["storeId"],
      );

  Map<dynamic?, dynamic> toJson() => {
        "id": id,
        "bankName": bankName,
        "accountHolder": accountHolder,
        "accountNumber": accountNumber,
        "ifscCode": ifscCode,
        "appWithdrawalPin": appWithdrawalPin,
        "isVerified": isVerified,
        "storeId": storeId,
      };
}
