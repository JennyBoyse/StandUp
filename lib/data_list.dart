import 'data/form_data.dart';
import 'data/form_data_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:firebase_database/firebase_database.dart';


class UserData{
  static final dataDao = FormDataDao();
  static final TextEditingController _dataController = TextEditingController();
  static final ScrollController _scrollController = ScrollController();

  static void addData(model) {
    if(_canSendData()) {
      final data = FormData(
        model.email,
        model.startTime,
        model.endTime,
        model.lunchBreak,
        model.lunchDuration,
        model.breakInterval,
        DateTime.now());
      dataDao.saveData(data);
      model.clear();
      }
  }

  static getSpecificUser(query, key) {
    DatabaseReference reference = query.orderByKey<Object?, Object?>().equalTo(key);
    print(reference);
    return reference;
  }

  static getUserData(obj, key) {
    FirebaseList(
        query: dataDao.getDataQuery(),
        onValue: (snapshot) {
          final json = snapshot.value as Map<Object?, Object?>;
          final data = FormData.fromJson(getSpecificUser(json, key));
          print(data);
          obj = data;
        },
    );
  }
  static bool _canSendData() => _dataController.text.isNotEmpty;

  static void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}