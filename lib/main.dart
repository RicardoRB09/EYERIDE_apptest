import 'package:eyeride_app_test/src/blocs/map/map_bloc.dart';
import 'package:eyeride_app_test/src/routes/routes.dart';
import 'package:eyeride_app_test/src/services/bottom_navbar_service.dart';
import 'package:eyeride_app_test/src/services/filter_service.dart';
import 'package:eyeride_app_test/src/services/vehicle_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MapBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => VehicleService(), lazy: false),
          ChangeNotifierProvider(create: (_) => BottomNavbarService()),
          ChangeNotifierProvider(create: (_) => FilterService()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Eyeride App test',
          initialRoute: 'home_screen',
          routes: getApplicationRoutes(),
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
        ),
      ),
    );
  }
}
