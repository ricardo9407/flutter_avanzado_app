import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/bloc/bloc_user.dart';
import 'platzi_trips.dart';
//import 'platzi_trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(title: 'Flutter Demo', home: PlatziTrips()
            //home: PlatziTripsCupertino(),
            ),
        bloc: UserBloc());
  }
}
