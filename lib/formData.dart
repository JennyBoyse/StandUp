import 'package:flutter/material.dart';

class Model {
  String startTime = "09:00";
  String endTime = "17:00";
  String lunchBreak = "12:30";
  String lunchDuration = "01:00";
  String breakInterval = "00:30";

  Model({required this.startTime, required this.endTime, required this.lunchBreak, required this.lunchDuration, required this.breakInterval});
}

class Result extends StatelessWidget {
  Model model;
  Result({required this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.startTime, style: TextStyle(fontSize: 22)),
            Text(model.endTime, style: TextStyle(fontSize: 22)),
            Text(model.lunchBreak, style: TextStyle(fontSize: 22)),
            Text(model.lunchDuration, style: TextStyle(fontSize: 22)),
            Text(model.breakInterval, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    ));
  }
}