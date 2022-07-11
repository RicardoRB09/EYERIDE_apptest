// To parse this JSON data, do
//
//     final vehicle = vehicleFromMap(jsonString);

import 'dart:convert';

import 'package:eyeride_app_test/src/models/vehicles.dart';

class VehicleInfo {
  VehicleInfo({
    required this.vehicleName,
    required this.speed,
    required this.gpsLat,
    required this.gpsLng,
    required this.heading,
  });

  String vehicleName;
  double speed;
  double gpsLat;
  double gpsLng;
  double heading;

  factory VehicleInfo.fromJson(String str) =>
      VehicleInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehicleInfo.fromMap(Map<String, dynamic> json) => VehicleInfo(
        vehicleName: json["vehicleName"],
        speed: json["speed"],
        gpsLat: json["gpsLat"].toDouble(),
        gpsLng: json["gpsLng"].toDouble(),
        heading: json["heading"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "vehicleName": vehicleName,
        "speed": speed,
        "gpsLat": gpsLat,
        "gpsLng": gpsLng,
        "heading": heading,
      };

  factory VehicleInfo.fromVehicle(Vehicle vehicle) => VehicleInfo(
      vehicleName: vehicle.vehicleName,
      speed: vehicle.speed,
      gpsLat: vehicle.gpsLat,
      gpsLng: vehicle.gpsLng,
      heading: vehicle.heading);
}
