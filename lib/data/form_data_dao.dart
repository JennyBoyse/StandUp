import 'package:firebase_database/firebase_database.dart';
import '../data/form_data.dart';

class FormDataDao {
  final DatabaseReference _dataRef = FirebaseDatabase.instance.ref('users');

  void saveData(FormData data) {
    _dataRef.push().set(data.toJson());
  }

  Query getDataQuery() {
    return _dataRef;
  }
}