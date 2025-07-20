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
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    //var data;
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
