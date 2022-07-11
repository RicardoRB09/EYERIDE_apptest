part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInit;
  final Set<Marker> markers;
  VehicleInfo vehicle;

  MapState({this.isMapInit = false, Set<Marker>? markers, VehicleInfo? vehicle})
      : markers = markers ?? const {},
        vehicle = vehicle ??
            VehicleInfo(
                vehicleName: "", speed: 0, gpsLat: 0, gpsLng: 0, heading: 0);

  MapState copyWith({
    bool? isMapInit,
    Set<Marker>? markers,
    VehicleInfo? vehicle,
  }) =>
      MapState(
        isMapInit: isMapInit ?? this.isMapInit,
        markers: markers ?? this.markers,
        vehicle: vehicle ?? this.vehicle,
      );

  @override
  List<Object> get props => [isMapInit, markers, vehicle];
}
