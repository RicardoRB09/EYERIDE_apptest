import 'dart:convert';

import 'package:eyeride_app_test/src/models/vehicles.dart';
import 'package:flutter/material.dart';

import '../constants/api.dart';

import 'package:http/http.dart' as http;

import '../models/devices.dart';

class VehicleService extends ChangeNotifier {
  VehicleService() {
    fetchVehicles();
    fetchDevices();
  }

  List<Vehicle> vehicleList = [];
  List<Device> deviceList = [];

  void fetchVehicles() async {
    Uri url =
        Uri.https(ApiConstants.BASE_URL, '/api/vehicles/with_last_position');

    const accessToken = ApiConstants.ACCESS_TOKEN;

    final res =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    final List decodedRes = json.decode(res.body);

    vehicleList =
        decodedRes.map((vehicle) => Vehicle.fromMap(vehicle)).toList();
    notifyListeners();
  }

  fetchDevices() async {
    Uri url = Uri.https(ApiConstants.BASE_URL, 'api/devices/assigned');

    const accessToken = ApiConstants.ACCESS_TOKEN;

    final res =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    final List decodedRes = json.decode(res.body);

    deviceList = decodedRes.map((device) => Device.fromMap(device)).toList();
    notifyListeners();
  }

  Device getDeviceById(String id) {
    Device foundDevice =
        deviceList.firstWhere((device) => device.id.toString() == id);

    return foundDevice;
  }

  List<Device> getDevicesByIds(List<String> ids) {
    List<Device> foundDevices = ids.map((id) => getDeviceById(id)).toList();

    return foundDevices;
  }

  List<Vehicle> sortByID(List<Vehicle> vehicles) {
    final sortedVechicles = [...vehicles];
    sortedVechicles.sort((a, b) {
      return a.vehicleId.compareTo(b.vehicleId);
    });
    return sortedVechicles;
  }

  List<Vehicle> sortByName(List<Vehicle> vehicles) {
    final sortedVechicles = [...vehicles];
    sortedVechicles.sort((a, b) {
      return a.vehicleName.compareTo(b.vehicleName);
    });
    return sortedVechicles;
  }

  List<Vehicle> sortByLastUpdated(List<Vehicle> vehicles) {
    final sortedVechicles = [...vehicles];
    sortedVechicles.sort((a, b) {
      return a.lastUpdated.compareTo(b.lastUpdated);
    });
    return sortedVechicles;
  }

  List<Vehicle> filterByStatusOrder(List<Vehicle> vehicles, int statusOrder) {
    final filteredVechicles = [...vehicles];
    filteredVechicles.where((vehicle) => vehicle.statusOrder == statusOrder);

    return filteredVechicles;
  }
}
