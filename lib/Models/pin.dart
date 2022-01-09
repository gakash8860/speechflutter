// To parse this JSON data, do
//
//     final pinStatus = pinStatusFromJson(jsonString);

import 'dart:convert';

PinStatus pinStatusFromJson(String str) => PinStatus.fromJson(json.decode(str));

String pinStatusToJson(PinStatus data) => json.encode(data.toJson());

class PinStatus {
  PinStatus({
   required this.dId,
   required this.pin1Status,
   required this.pin2Status,
   required this.pin3Status,
   required this.pin4Status,
   required this.pin5Status,
   required this.pin6Status,
   required this.pin7Status,
   required this.pin8Status,
   required this.pin9Status,
   required this.pin10Status,
  required  this.pin11Status,
   required this.pin12Status,
   required this.pin13Status,
    this.pin14Status,
    this.pin15Status,
    this.pin16Status,
    this.pin17Status,
    this.pin18Status,
    this.pin19Status,
    this.pin20Status,
  });

  String dId;
  int pin1Status;
  int pin2Status;
  int pin3Status;
  int pin4Status;
  int pin5Status;
  int pin6Status;
  int pin7Status;
  int pin8Status;
  int pin9Status;
  int pin10Status;
  int pin11Status;
  int pin12Status;
  int pin13Status;
  dynamic pin14Status;
  dynamic pin15Status;
  dynamic pin16Status;
  dynamic pin17Status;
  dynamic pin18Status;
  dynamic pin19Status;
  dynamic pin20Status;

  factory PinStatus.fromJson(Map<String, dynamic> json) => PinStatus(
    dId: json["d_id"],
    pin1Status: json["pin1Status"],
    pin2Status: json["pin2Status"],
    pin3Status: json["pin3Status"],
    pin4Status: json["pin4Status"],
    pin5Status: json["pin5Status"],
    pin6Status: json["pin6Status"],
    pin7Status: json["pin7Status"],
    pin8Status: json["pin8Status"],
    pin9Status: json["pin9Status"],
    pin10Status: json["pin10Status"],
    pin11Status: json["pin11Status"],
    pin12Status: json["pin12Status"],
    pin13Status: json["pin13Status"],
    pin14Status: json["pin14Status"],
    pin15Status: json["pin15Status"],
    pin16Status: json["pin16Status"],
    pin17Status: json["pin17Status"],
    pin18Status: json["pin18Status"],
    pin19Status: json["pin19Status"],
    pin20Status: json["pin20Status"],
  );

  Map<String, dynamic> toJson() => {
    "d_id": dId,
    "pin1Status": pin1Status,
    "pin2Status": pin2Status,
    "pin3Status": pin3Status,
    "pin4Status": pin4Status,
    "pin5Status": pin5Status,
    "pin6Status": pin6Status,
    "pin7Status": pin7Status,
    "pin8Status": pin8Status,
    "pin9Status": pin9Status,
    "pin10Status": pin10Status,
    "pin11Status": pin11Status,
    "pin12Status": pin12Status,
    "pin13Status": pin13Status,
    "pin14Status": pin14Status,
    "pin15Status": pin15Status,
    "pin16Status": pin16Status,
    "pin17Status": pin17Status,
    "pin18Status": pin18Status,
    "pin19Status": pin19Status,
    "pin20Status": pin20Status,
  };
}

// To parse this JSON data, do
//
//     final pinName = pinNameFromJson(jsonString);


PinName pinNameFromJson(String str) => PinName.fromJson(json.decode(str));

String pinNameToJson(PinName data) => json.encode(data.toJson());

class PinName {
  PinName({
  required  this.dId,
  required  this.pin1Name,
  required  this.pin2Name,
  required  this.pin3Name,
  required  this.pin4Name,
  required  this.pin5Name,
  required  this.pin6Name,
  required  this.pin7Name,
  required  this.pin8Name,
  required  this.pin9Name,
  required  this.pin10Name,
  required  this.pin11Name,
  required  this.pin12Name,
    this.pin13Name,
    this.pin14Name,
    this.pin15Name,
    this.pin16Name,
    this.pin17Name,
    this.pin18Name,
    this.pin19Name,
    this.pin20Name,
  });

  String dId;
  String pin1Name;
  String pin2Name;
  String pin3Name;
  String pin4Name;
  String pin5Name;
  String pin6Name;
  String pin7Name;
  String pin8Name;
  String pin9Name;
  String pin10Name;
  String pin11Name;
  String pin12Name;
  dynamic pin13Name;
  dynamic pin14Name;
  dynamic pin15Name;
  dynamic pin16Name;
  dynamic pin17Name;
  dynamic pin18Name;
  dynamic pin19Name;
  dynamic pin20Name;

  factory PinName.fromJson(Map<String, dynamic> json) => PinName(
    dId: json["d_id"],
    pin1Name: json["pin1Name"],
    pin2Name: json["pin2Name"],
    pin3Name: json["pin3Name"],
    pin4Name: json["pin4Name"],
    pin5Name: json["pin5Name"],
    pin6Name: json["pin6Name"],
    pin7Name: json["pin7Name"],
    pin8Name: json["pin8Name"],
    pin9Name: json["pin9Name"],
    pin10Name: json["pin10Name"],
    pin11Name: json["pin11Name"],
    pin12Name: json["pin12Name"],
    pin13Name: json["pin13Name"],
    pin14Name: json["pin14Name"],
    pin15Name: json["pin15Name"],
    pin16Name: json["pin16Name"],
    pin17Name: json["pin17Name"],
    pin18Name: json["pin18Name"],
    pin19Name: json["pin19Name"],
    pin20Name: json["pin20Name"],
  );

  Map<String, dynamic> toJson() => {
    "d_id": dId,
    "pin1Name": pin1Name,
    "pin2Name": pin2Name,
    "pin3Name": pin3Name,
    "pin4Name": pin4Name,
    "pin5Name": pin5Name,
    "pin6Name": pin6Name,
    "pin7Name": pin7Name,
    "pin8Name": pin8Name,
    "pin9Name": pin9Name,
    "pin10Name": pin10Name,
    "pin11Name": pin11Name,
    "pin12Name": pin12Name,
    "pin13Name": pin13Name,
    "pin14Name": pin14Name,
    "pin15Name": pin15Name,
    "pin16Name": pin16Name,
    "pin17Name": pin17Name,
    "pin18Name": pin18Name,
    "pin19Name": pin19Name,
    "pin20Name": pin20Name,
  };
}
