import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_avanzado_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  //Casos de uso
  //1. SingIn a la aplicación Google
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
  }
}
