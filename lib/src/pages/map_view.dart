import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/map/map_bloc.dart';

class MapView extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Marker> markers;

  const MapView(
      {Key? key, required this.initialLocation, required this.markers})
      : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  BitmapDescriptor? myIcon;

  @override
  Widget build(BuildContext context) {
    final CameraPosition developerHouse = CameraPosition(
        target: LatLng(
            widget.initialLocation.latitude, widget.initialLocation.longitude),
        zoom: 5);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return GoogleMap(
      myLocationEnabled: true,
      initialCameraPosition: developerHouse,
      markers: widget.markers,
      zoomControlsEnabled: true,
      tileOverlays: const {},
      onMapCreated: (controller) => mapBloc.add(OnMapInitEvent(controller)),
    );
  }
}
