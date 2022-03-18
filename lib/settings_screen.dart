import 'package:flutter/material.dart';

import 'app_theme.dart';

class SettingsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const SettingsScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
            iconSize: 50,
            icon: Image.asset('assets/images/logo.png'),
            onPressed: (){changePage(AppTheme.HOMEPAGE);},
          )
        ],
        title: const Text("Settings", style: AppTheme.headline,),
        backgroundColor: Colors.transparent, elevation: 0.0,),
      body: Center(child: Column(children: [const SizedBox(height: 20), Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.28,
        padding: const EdgeInsets.all(16.0),
        child: Column(
                children: [Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.white,
                    border: Border.all(color: AppTheme.blue, width: 4),
                  ),
                  child: const CircleAvatar(radius: 30.0, child: ClipRRect(child: Icon(Icons.person_pin_rounded, color: AppTheme.lightPurple, size:40)), backgroundColor: Colors.transparent),
                ),
                  Container(padding: EdgeInsets.all(10), child: Text('Settings', style: AppTheme.card4)),
                  Container(padding: EdgeInsets.fromLTRB(30,0,30,0), child: const Text('Modify and save your settings using the tabs provided', style: AppTheme.card6, textAlign: TextAlign.center),)
                ]),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.darkPurple,
                  AppTheme.lightPurple,
                ],
                tileMode: TileMode.clamp
            )),
      ),
        SizedBox(height: 20),
        Container(
            height: 50,
            child: MaterialApp(
                home: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppTheme.white,
                    bottom: const TabBar(
                      labelColor: AppTheme.black,
                      labelStyle: AppTheme.card7,
                      tabs: [
                        Tab(text: 'Account'),
                        Tab(text: 'Workday'),
                      ],
                    ),
                  ),
                    body: const TabBarView(
                      children: [
                        Text('Test'),
                        Icon(Icons.directions_car, color: AppTheme.black),
                      ]
                    )
                )
          )))
      ]))
    );
  }
}