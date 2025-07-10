import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/data_service.dart';

class FirestoreService implements DatabaseService {
  // Static variable to keep track of user ID
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      // If docId is provided, update the document with that ID
      await firestore.collection(path).doc(docId).set(data).then(
        (value) {
          log('Data updated successfully in $path with docId $docId');
        },
      ).catchError(
        (error) {
          log('Error updating data in $path with docId $docId: $error');
        },
      );
    } else {
      // If no docId is provided, add a new document
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

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    var docData = await firestore.collection(path).doc(docId).get();
    return docData.data() ?? {};
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
