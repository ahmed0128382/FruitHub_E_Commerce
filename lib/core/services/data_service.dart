abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});
  Future<dynamic> getData({required String path, String? docId});
  Future<bool> checkIfDataExists({required String path, required String docId});
}
