import 'package:eyeride_app_test/src/services/bottom_navbar_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> routes = ['home_screen', 'vehicles_screen'];

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navbarService = Provider.of<BottomNavbarService>(context);
    return BottomNavigationBar(
      onTap: (int currentIndex) {
        navbarService.selectedIndex = currentIndex;
        // Navigator.of(context).pushNamed(routes[currentIndex]);
      },
      currentIndex: navbarService.selectedIndex,
      selectedItemColor: Colors.amber,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_sharp), label: 'Vehicle'),
      ],
    );
  }
}
