import 'package:eyeride_app_test/src/blocs/map/map_bloc.dart';
import 'package:eyeride_app_test/src/pages/vehicles_screen.dart';
import 'package:eyeride_app_test/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../services/bottom_navbar_service.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/filtering_modal.dart';
import 'map_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final LatLng defaultLocation = LatLng(41.813495, -72.653662);
    final navbarService = Provider.of<BottomNavbarService>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: navbarService.selectedIndex == 0
          ? AppBar(
              title: const Center(child: Text('EYERIDE - Vehicles & Devices')),
            )
          : AppBar(
              title: const Center(child: Text('Vehicles')),
              actions: [
                IconButton(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        enableDrag: false,
                        context: context,
                        builder: (context) =>
                            SafeArea(child: const FilteringModal()),
                      );
                    },
                    icon: const Icon(Icons.filter_alt)),
              ],
            ),
      body: MultiBlocListener(
          listeners: [
            BlocListener<MapBloc, MapState>(listener: (context, mapState) {
              if (mapState.vehicle.vehicleName != "") {
                InformationAlert(context,
                        " Vehicle name: ${mapState.vehicle.vehicleName} \n Latitude: ${mapState.vehicle.gpsLat} \n Longitude: ${mapState.vehicle.gpsLng} \n Last Speed: ${mapState.vehicle.speed}")
                    .show();
              }
            }),
          ],
          child: BlocBuilder<MapBloc, MapState>(builder: (context, mapState) {
            return navbarService.selectedIndex == 0
                ? MapView(
                    initialLocation: defaultLocation,
                    markers: mapState.markers,
                  )
                : const VehiclesScreen();
          })),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

//sha-1 B1:70:69:CB:1A:8A:93:06:F5:70:59:6A:10:B8:62:59:73:49:C1:7C