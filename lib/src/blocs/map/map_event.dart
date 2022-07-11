part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitEvent(this.controller);
}

class ShowMarkerEvent extends MapEvent {
  final List<Vehicle> vehicleList;
  const ShowMarkerEvent(this.vehicleList);
}

class OnVehicleShowInfoEvent extends MapEvent {
  final VehicleInfo vehicle;

  const OnVehicleShowInfoEvent(this.vehicle);
}
