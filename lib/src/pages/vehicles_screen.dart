import 'package:eyeride_app_test/src/models/vehicles.dart';
import 'package:eyeride_app_test/src/services/filter_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_view/tree_view.dart';

import '../services/vehicle_service.dart';
import '../widgets/detail_item_grid.dart';
import '../widgets/item_grid.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicleService = Provider.of<VehicleService>(context);
    final filterService = Provider.of<FilterService>(context);
    List<Vehicle> vehicles = vehicleService.vehicleList;

    if (filterService.sortingOption == SortingOptions.vehicleId &&
        filterService.areFiltersApplied) {
      vehicles = vehicleService.sortByID(vehicles);
    } else if (filterService.sortingOption == SortingOptions.vehicleName &&
        filterService.areFiltersApplied) {
      vehicles = vehicleService.sortByName(vehicles);
    } else if (filterService.sortingOption == SortingOptions.lastUpdated &&
        filterService.areFiltersApplied) {
      vehicles = vehicleService.sortByLastUpdated(vehicles);
    }

    if (filterService.filteringOption == FilteringOptions.statusOrder &&
        filterService.areFiltersApplied) {
      vehicles = vehicleService.filterByStatusOrder(vehicles, 1);
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: TreeView(
        startExpanded: false,
        children: <TreeViewChild>[
          ...vehicles.map((vehicle) {
            final devices =
                vehicleService.getDevicesByIds(vehicle.deviceIds.split(", "));
            return TreeViewChild(
                parent: ItemGrid(
                  icon: const Icon(Icons.directions_bus_filled_rounded),
                  name: vehicle.vehicleName,
                  subtitle: "Vehicle ID: ${vehicle.vehicleId}",
                  hasChildren: devices.isNotEmpty,
                ),
                children: <TreeViewChild>[
                  ...devices.map((device) {
                    return TreeViewChild(
                        parent: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: ItemGrid(
                              icon: const Icon(Icons.devices_other),
                              name: device.deviceName,
                              subtitle: device.deviceTypeId.toString()),
                        ),
                        children: <Widget>[
                          DetailItemGrid(
                            items: [
                              "Type name: ${device.deviceTypeName}",
                              "IP Address: ${device.ip}",
                              "MAC Address: ${device.macAddress}"
                            ],
                          )
                        ]);
                  })
                ]);
          })
        ],
      ),
    );
  }
}
