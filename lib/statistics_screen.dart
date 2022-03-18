import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Statistics"),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[

                Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 6.0)),
              ]
          ),
        ),
      ),
    );
  }
}