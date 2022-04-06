import 'form_data.dart';
import 'form_data_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserData{
  static final dataDao = FormDataDao();
  static final TextEditingController _dataController = TextEditingController();
  static final ScrollController _scrollController = ScrollController();

  static void addData(model) {
    if(_canSendData()) {
      final data = User(
        model.id,
        model.interval,
        DateTime.now().toString(),
        model.lunchBreak,
        model.lunchDuration,
        model.startTime,
        model.endTime,
        model.tokenID);
      dataDao.saveData(data, data.id);
      }
  }

  static bool _canSendData() => _dataController.text.isNotEmpty;

  static void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}