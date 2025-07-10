import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/data_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data).then(
      (value) {
        log('Data added successfully to $path');
      },
    ).catchError(
      (error) {
        log('Error adding data to $path: $error');
      },
    );
  }
}
