import 'dart:io';
import 'package:flutter_avanzado_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageAPI();
  uploadFile(String path, File image) =>
      _firebaseStorageAPI.uploadFile(path, image);
}
