// To parse this JSON data, do
//
//     final device = deviceFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Device {
  Device({
    required this.id,
    required this.vehicleId,
    required this.vehicleName,
    required this.deviceTypeId,
    required this.deviceTypeName,
    this.creatorUserId,
    this.deviceImei,
    this.ip,
    this.port,
    required this.hasAudio,
    required this.shouldRecordAudio,
    this.timezone,
    this.timezoneHours,
    this.timezoneHoursNoDst,
    required this.companyId,
    required this.companyName,
    this.priority,
    this.macAddress,
    required this.isActive,
    required this.isDeleted,
    required this.deviceName,
    required this.lastUpdated,
  });

  int id;
  int vehicleId;
  String vehicleName;
  int deviceTypeId;
  String deviceTypeName;
  String? creatorUserId;
  String? deviceImei;
  String? ip;
  int? port;
  int hasAudio;
  bool shouldRecordAudio;
  String? timezone;
  double? timezoneHours;
  double? timezoneHoursNoDst;
  int companyId;
  String companyName;
  int? priority;
  String? macAddress;
  bool isActive;
  bool isDeleted;
  String deviceName;
  DateTime lastUpdated;

  factory Device.fromJson(String str) => Device.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Device.fromMap(Map<String, dynamic> json) => Device(
        id: json["id"],
        vehicleId: json["vehicleId"],
        vehicleName: json["vehicleName"],
        deviceTypeId: json["deviceTypeId"],
        deviceTypeName: json["deviceTypeName"],
        creatorUserId: json["creatorUserId"],
        deviceImei: json["deviceIMEI"],
        ip: json["ip"],
        port: json["port"],
        hasAudio: json["hasAudio"],
        shouldRecordAudio: json["shouldRecordAudio"],
        timezone: json["timezone"],
        timezoneHours: json["timezoneHours"],
        timezoneHoursNoDst: json["timezoneHoursNoDST"],
        companyId: json["companyId"],
        companyName: json["companyName"],
        priority: json["priority"],
        macAddress: json["macAddress"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        deviceName: json["deviceName"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "vehicleId": vehicleId,
        "vehicleName": vehicleName,
        "deviceTypeId": deviceTypeId,
        "deviceTypeName": deviceTypeName,
        "creatorUserId": creatorUserId,
        "deviceIMEI": deviceImei,
        "ip": ip,
        "port": port,
        "hasAudio": hasAudio,
        "shouldRecordAudio": shouldRecordAudio,
        "timezone": timezone,
        "timezoneHours": timezoneHours,
        "timezoneHoursNoDST": timezoneHoursNoDst,
        "companyId": companyId,
        "companyName": companyName,
        "priority": priority,
        "macAddress": macAddress,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "deviceName": deviceName,
        "lastUpdated": lastUpdated.toIso8601String(),
      };
}
