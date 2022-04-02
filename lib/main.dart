import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:stand_up_2/services/local_notification_service.dart';

import 'pages/home_screen.dart';
import 'pages/settings_screen.dart';
import 'pages/statistics_screen.dart';
import 'pages/tips_screen.dart';
import 'pages/activities_screen.dart';
import 'app_theme.dart';

// receive message when app in background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const StandUp());
}

class StandUp extends StatelessWidget {
  static const String _title = 'StandUp';

  const StandUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: const AbstractPage(),
      routes: {
          'homescreen': (context) => StandUp(),
        });
  }
}

class ListItem {
  final Text title;
  final ListView content;

  const ListItem(this.title, this.content);
}

class AbstractPage extends StatefulWidget {
  const AbstractPage({Key? key}) : super(key: key);

  @override
  _AbstractPageState createState() => _AbstractPageState();
}

class _AbstractPageState extends State<AbstractPage> {
  late int _currentIndex;
  late final List _pageOptions;

  _AbstractPageState() {
    _currentIndex = 0;

    temp(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    _pageOptions = [
      HomeScreen(changePage: temp),
      ActivitiesScreen(changePage: temp),
      StatisticsScreen(changePage: temp),
      TipsScreen(changePage: temp),
      SettingsScreen(changePage: temp)
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.requestPermission().then((value) {
      print(value);
    });

    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
    });

    FirebaseMessaging.instance.getAPNSToken().then((APNStoken) {
      print(APNStoken);
    });

    // gives the message and opens app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null) {
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    // foreground notification
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });

    // onTap notification action - app is in background but open
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.lightGrey,
        body: _pageOptions[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: AppTheme.darkGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_run),
                label: 'Activities',
                backgroundColor: AppTheme.darkGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph),
                label: 'Statistics',
                backgroundColor: AppTheme.darkGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb),
                label: 'Tips',
                backgroundColor: AppTheme.darkGrey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: AppTheme.darkGrey,
              ),
            ],
            selectedItemColor: AppTheme.blue,
          ),
        ),
        appBar: null);
  }
}
