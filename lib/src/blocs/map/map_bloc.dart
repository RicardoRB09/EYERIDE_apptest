import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eyeride_app_test/src/constants/api.dart';
import 'package:eyeride_app_test/src/models/vehicles.dart';
import 'package:eyeride_app_test/src/themes/map_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../models/vehicleInfo.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  List<Vehicle> vehicleList = [];
  GoogleMapController? _mapController;

  Set<Marker> vehicleMarker = {};
  BitmapDescriptor? navigationIcon;

  MapBloc() : super(MapState()) {
    on<OnMapInitEvent>(_onInitMap);
    on<ShowMarkerEvent>(_onShowMarker);
    on<OnVehicleShowInfoEvent>(
        (OnVehicleShowInfoEvent event, Emitter<MapState> emit) {
      emit(state.copyWith(vehicle: event.vehicle));
    });

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/navigation-icon.png')
        .then((value) {
      navigationIcon = value;
    });

    init();
  }

  init() async {
    await _fetchVehicles();
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      await _fetchVehicles();
    });
  }

  Future _fetchVehicles() async {
    Uri url =
        Uri.https(ApiConstants.BASE_URL, '/api/vehicles/with_last_position');

    const accessToken = ApiConstants.ACCESS_TOKEN;

    final res =
        await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    final List decodedRes = json.decode(res.body);

    vehicleList =
        decodedRes.map((vehicle) => Vehicle.fromMap(vehicle)).toList();
    add(ShowMarkerEvent(vehicleList));
  }

  void _onInitMap(OnMapInitEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(mapTheme));
    emit(state.copyWith(isMapInit: true));
  }

  void _onShowMarker(ShowMarkerEvent event, Emitter<MapState> emit) {
    vehicleMarker = <Marker>{};
    if (vehicleList.isNotEmpty) {
      for (var vehicle in vehicleList) {
        vehicleMarker.add(Marker(
          onTap: () {
            VehicleInfo info = VehicleInfo.fromVehicle(vehicle);
            add(OnVehicleShowInfoEvent(info));
          },
          rotation: vehicle.heading,
          markerId: MarkerId(vehicle.vehicleId.toString()),
          position: LatLng(vehicle.gpsLat, vehicle.gpsLng),
          icon: navigationIcon ?? BitmapDescriptor.defaultMarker,
        ));
      }
    }
    emit(state.copyWith(markers: vehicleMarker));
  }
}
