import 'package:flutter/material.dart';
import 'package:stand_up_2/home_screen.dart';
import 'package:stand_up_2/settings_screen.dart';
import 'package:stand_up_2/statistics_screen.dart';
import 'package:stand_up_2/tips_screen.dart';
import 'activities_screen.dart';
import 'app_theme.dart';

void main() => runApp(const StandUp());

class StandUp extends StatelessWidget {
  static const String _title = 'StandUp';

  const StandUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: const AbstractPage(),
    );
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

  static const List<Widget> _pages = <Widget>[
    Text('Home', style: AppTheme.display1,),
    Text('Activities', style: AppTheme.display1,),
    Text('Statistics', style: AppTheme.display1,),
    Text('Tips', style: AppTheme.display1,),
    Text('Settings', style: AppTheme.display1,),
  ];

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
      const StatisticsScreen(),
      TipsScreen(changePage: temp),
      const SettingsScreen()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // _pageOptions[_currentIndex]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: _pageOptions[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), ),
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
    );
  }
}
