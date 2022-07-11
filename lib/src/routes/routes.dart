import 'package:eyeride_app_test/src/pages/home_screen.dart';
import 'package:eyeride_app_test/src/pages/vehicles_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home_screen': (BuildContext context) => const HomeScreen(),
    'vehicles_screen': (BuildContext context) => const VehiclesScreen(),
  };
}
