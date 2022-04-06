import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:stand_up_2/services/local_notification_service.dart';

import 'data/form_data.dart';
import 'pages/home_screen.dart';
import 'pages/settings_screen.dart';
import 'pages/statistics_screen.dart';
import 'pages/tips_screen.dart';
import 'pages/activities_screen.dart';
import 'app_theme.dart';

// receive notification when app in background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const StandUp());
}

/*Future<void> saveTokenToDatabase(String token) async {
  //String userId = FirebaseAuth.instance.currentUser!.uid;
  String userId = 'testUser';

  await FirebaseFirestore.instance.collection('users').doc(userId).update({'tokens':FieldValue.arrayUnion([token])});
}*/

class StandUp extends StatelessWidget {
  static const String _title = 'StandUp';

  const StandUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      debugShowCheckedModeBanner: false,
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

// create abstract page template to hold page data
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

  /*void saveAndroidToken(token) async {
    await saveTokenToDatabase(token);
  }

  void saveAPNSToken(token) async {
    await saveTokenToDatabase(token);
  }
*/
  @override
  void initState() {
    super.initState();

    // initialise Firebase cloud messaging service
    LocalNotificationService.initialize(context);

    var userToken = '';

    // request user permission to send notifications
    FirebaseMessaging.instance.requestPermission().then((value) {
      print(value);
    });

    // record user device token on login (Android)
    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
      userToken = token.toString();
    });

    // record user device token on login (iOS)
    FirebaseMessaging.instance.getAPNSToken().then((APNStoken) {
      print(APNStoken);
      userToken = APNStoken.toString();
    });

    var userIdent = 'standuptestuser+9';

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // look for the userID in the Firebase database, pull user data into app
    users.doc(userIdent).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Found user: ${documentSnapshot.data()}');

        User user = User(
            documentSnapshot.get('id'),
            documentSnapshot.get('interval'),
            documentSnapshot.get('lastProcessed'),
            documentSnapshot.get('lunchBreak'),
            documentSnapshot.get('lunchDuration'),
            documentSnapshot.get('startTime'),
            documentSnapshot.get('endTime'),
            documentSnapshot.get('tokenID')
        );

        print('User ID: ${user.id}');

        user.tokenID = "XX";

        // update the user record to change their FCM token
        users
            .doc(userIdent)
            .set({'tokenID': "${user.tokenID}"}, SetOptions(merge: true))
            .then((value) => print('User Token Updated'))
            .catchError((error) => print('Failed to update user: $error'));
      } else {
        print('User does not exist on the database, creating one');

        users
            .doc(userIdent)
            .set({
          'id': '2',
          'interval': '00:45',
          'lastProcessed': '',
          'lunchBreak': '12:00',
          'lunchDuration': '01:00',
          'startTime': '09:00',
          'endTime': '17:00',
          'tokenID': 'X'
        }).then((value) => print('User Added'))
            .catchError((error) => print('Failed to add user: $error')
        );
      }
    });

    // sends notification and opens app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null) {
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    // foreground notification from console
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });

    // notification onTap action - app is in background but open
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  // build home screen
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