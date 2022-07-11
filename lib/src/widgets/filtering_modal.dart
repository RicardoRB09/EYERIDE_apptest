import 'package:eyeride_app_test/src/services/filter_service.dart';
import 'package:eyeride_app_test/src/services/vehicle_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilteringModal extends StatelessWidget {
  const FilteringModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicleService = Provider.of<VehicleService>(context, listen: false);
    final filterService = Provider.of<FilterService>(context);
    // print('Pase por aqui ${filterService.sortingOption}');
    print('Pase por aqui ${filterService.filteringOption}');

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      filterService.clean();
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.black,
                  )),
              TextButton(
                  onPressed: () {
                    filterService.clean();
                  },
                  child: const Text(
                    'Clean',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('Order By:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                ListTile(
                  leading: const Icon(Icons.code_outlined),
                  title: const Text('Vehicle ID'),
                  trailing:
                      filterService.sortingOption == SortingOptions.vehicleId
                          ? const Icon(
                              Icons.radio_button_checked,
                              color: Colors.amber,
                            )
                          : const Icon(Icons.radio_button_unchecked),
                  onTap: (() {
                    filterService.sortingOption = SortingOptions.vehicleId;
                  }),
                ),
                ListTile(
                  leading: const Icon(Icons.text_rotation_angledown_sharp),
                  title: const Text('Vehicle name'),
                  trailing:
                      filterService.sortingOption == SortingOptions.vehicleName
                          ? const Icon(
                              Icons.radio_button_checked,
                              color: Colors.amber,
                            )
                          : const Icon(Icons.radio_button_unchecked),
                  onTap: (() {
                    filterService.sortingOption = SortingOptions.vehicleName;
                  }),
                ),
                ListTile(
                  leading: const Icon(Icons.watch_later_outlined),
                  title: const Text('Last updated'),
                  trailing:
                      filterService.sortingOption == SortingOptions.lastUpdated
                          ? const Icon(
                              Icons.radio_button_checked,
                              color: Colors.amber,
                            )
                          : const Icon(Icons.radio_button_unchecked),
                  onTap: (() {
                    filterService.sortingOption = SortingOptions.lastUpdated;
                  }),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('Filter By',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('Status order : 1'),
                        backgroundColor: Colors.white,
                        selectedColor: Colors.amber,
                        shape: const StadiumBorder(
                            side: BorderSide(color: Colors.grey)),
                        selected: filterService.filteringOption ==
                            FilteringOptions.statusOrder,
                        onSelected: (bool selected) {
                          filterService.filteringOption =
                              selected ? FilteringOptions.statusOrder : null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              filterService.apply();
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                elevation: MaterialStateProperty.all<double>(5.0),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            child: const Text('Apply', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
