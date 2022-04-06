import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../custom_components/custom_carousel.dart';
import '../breakpoints.dart';

final List<ActivityItem> activitiesList = [
  const ActivityItem(activity:'Lunge', time: '3 minutes', intensity:'Low', category:'test', instructionsList: '1. Start in a standing position with your feet hip-width apart. \n\n 2. Step forward longer than a walking stride so one leg is ahead of your torso and the other is behind. Your foot should land flat and remain flat while it’s on the ground. Your rear heel will rise off of the ground. \n\n 3. Bend your knees to approximately 90 degrees as you lower yourself. Remember to keep your trunk upright and core engaged.\n\n 4. Then, forcefully push off from your front leg to return to the starting position.', imagePath: 'assets/images/activity_icons/lunge.png'),
  const ActivityItem(activity:'Squats', time: '2 minutes', intensity:'Medium', category:'test', instructionsList: "1. Start in a standing position with your feet hip-width apart. Your spine should be neutral, shoulders back, chest open. \n\n 2. Initiate the movement by sending the hips back as if you're sitting into a chair. \n\n 3. Bend knees to lower down as far as possible with chest lifted in a controlled movement. Keep lower back neutral.\n\n 4. Press through heels to stand back up to the starting position.", imagePath: 'assets/images/activity_icons/squats.png'),
  const ActivityItem(activity:'Sit Ups', time: '2 minutes', intensity:'Medium', category:'test', instructionsList: "1. Lie down on your back. \n\n 2. Bend your legs and place feet firmly on the ground to stabilize your lower body. \n\n 3. Cross your hands to opposite shoulders or place them behind your ears, without pulling on your neck. \n\n 4. Curl your upper body all the way up toward your knees. Exhale as you lift. \n\n 5. Slowly, lower yourself down, returning to your starting point. Inhale as you lower.", imagePath: 'assets/images/activity_icons/sit_ups.png'),
  const ActivityItem(activity:'Star Jumps', time: '3 minutes', intensity:'High', category:'test', instructionsList: "1. Stand upright with your legs together, arms at your sides. \n\n 2. Bend your knees slightly, and jump into the air. \n\n 3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head. \n\n 4. Jump back to starting position. \n\n 5. Repeat.", imagePath: 'assets/images/activity_icons/star_jump.png'),
  const ActivityItem(activity:'Marching', time: '2 minutes', intensity:'Medium', category:'test', instructionsList: "1. Stand straight with your elbows bent at a 90-degree angle and your feet hip width apart. \n\n 2. Bring your right elbow forward at the same time as you bring your left knee up. \n\n 3. Repeat on the opposite side and keep alternating sides until set is complete.", imagePath: 'assets/images/activity_icons/marching.png'),
  const ActivityItem(activity:'Stair Train', time: '5 minutes', intensity:'Low', category:'test', instructionsList: "1. Start at the bottom of the stairs and step up two steps with your right foot, bringing your left foot to meet it. \n\n 2. Immediately step up two more steps, leading with your left foot. \n\n 3. Repeat this sequence for 30 seconds. Go as quickly as you can safely here. \n\n 4. Return to the bottom of the stairs and repeat for 3 sets.", imagePath: 'assets/images/activity_icons/stair_training.png'),
  const ActivityItem(activity:'Burpees', time: '2 minutes', intensity:'High', category:'test', instructionsList: "1. Start in a squat position with your knees bent, back straight, and your feet about shoulder-width apart. \n\n 2. Lower your hands to the floor in front of you so they're just inside your feet. \n\n 3. With your weight on your hands, kick your feet back so you're on your hands and toes, and in a pushup position. \n\n 4. Keeping your body straight from head to heels, do one pushup. \n\n 5. Do a frog kick by jumping your feet back to their starting position. \n\n 6. Stand and reach your arms over your head. \n\n 7. Jump quickly into the air so you land back where you started.", imagePath: 'assets/images/activity_icons/burpee.png'),
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
                      child: Center(child: TopPicks(activitiesList: activitiesList,customWidth: screenWidth*0.8,context: context,))),
                  Container(padding: EdgeInsets.symmetric(horizontal: sliverHorizontalPadding(screenWidth)),
                      child: Center(child: ActivitiesGrid(crossAxisCount: crossAxisCount, activitiesList: activitiesList,))),
                  const SizedBox(height:20),
                ]
              ),
            )
          )
    );
  }
}

class ActivityItem {
  const ActivityItem({required this.activity, required this.time, required this.intensity, required this.category, required this.instructionsList, required this.imagePath});

  final String activity;
  final String time;
  final String intensity;
  final String category;
  final String instructionsList;
  final String imagePath;
}