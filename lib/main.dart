import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/ui/screens/sign_in_screen.dart';
import 'User/bloc/bloc_user.dart';
//import 'platzi_trips.dart';
//import 'platzi_trips_cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          title: 'Flutter Demo', home: SignInScreen(),
          //home: PlatziTrips()
          //home: PlatziTripsCupertino(),
        ),
        bloc: UserBloc());
  }
}
