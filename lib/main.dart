import 'package:flutter/material.dart';
import 'platzi_trips.dart';
//import 'platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlatziTrips()
        //home: PlatziTripsCupertino(),
        );
  }
}
