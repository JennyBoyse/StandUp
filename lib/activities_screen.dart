import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'custom_components/custom_carousel.dart';
import 'breakpoints.dart';

final List<ActivityItem> activitiesList = [
  const ActivityItem(activity:'Lunge', time: '3 minutes', intensity:'low', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Squats', time: '2 minutes', intensity:'medium', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Sit Ups', time: '2 minutes', intensity:'medium', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Jumping Jacks', time: '3 minutes', intensity:'high', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Marching', time: '2 minutes', intensity:'medium', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Stair Training', time: '15 minutes', intensity:'low', category:'test', image: Icon(Icons.home)),
  const ActivityItem(activity:'Burpees', time: '2 minutes', intensity:'high', category:'test', image: Icon(Icons.home)),
];

class ActivitiesScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const ActivitiesScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth >= Breakpoints.twoColLayoutMinWidth ? 2 : 1;
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
        title: const Text("Activities", style: AppTheme.headline,),
        backgroundColor: Colors.transparent, elevation: 0.0,),
      body: Scaffold(
            body: Center(
              child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(children: const [SizedBox(width: 20),
                    Text("Today's Top Picks", style: AppTheme.card1,),]),
                  Container(alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: Center(child: TopPicks(activitiesList: activitiesList,customWidth: screenWidth*0.8,))),
                  Container(padding: EdgeInsets.symmetric(horizontal: sliverHorizontalPadding(screenWidth)),
                      child: ActivitiesGrid(crossAxisCount: crossAxisCount, activitiesList: activitiesList,)),
                  const SizedBox(height:20),
                ]
              ),
            )
          )
    );
  }
}

class ActivityItem {
  const ActivityItem({required this.activity, required this.time, required this.intensity, required this.category, required this.image});

  final String activity;
  final String time;
  final String intensity;
  final String category;
  final Icon image;
}