import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/form_data.dart';

class FormDataDao {
  final CollectionReference _dataRef = FirebaseFirestore.instance.collection('users');

  void saveData(User data, String id) {
    _dataRef.doc(id).set(data.toJson());
  }

  Query getDataQuery() {
    return _dataRef;
  }
}