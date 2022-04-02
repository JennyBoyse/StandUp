import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'data/form_data.dart';
import 'data/form_data_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static getKeyValue(data, key) {
    return data[key];
  }

  static getUserData(obj, key) {
    FirebaseAnimatedList(
      query: dataDao.getDataQuery(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<Object?, Object?>;
        final data = getKeyValue(json, key);
        return data;
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