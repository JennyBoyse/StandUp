import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';
import 'package:custom_timer/custom_timer.dart';

class ActivitySubpage extends StatelessWidget {
  final String activity;
  final String time;
  final String intensity;
  final String instructionsList;


  ActivitySubpage(
      {Key? key,
      required this.activity,
      required this.time,
      required this.intensity,
      required this.instructionsList})
      : super(key: key);

  final List<Tab> activityTabs = <Tab>[
    const Tab(text: 'Timer'),
    const Tab(text: 'Instructions'),
  ];

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
            onPressed: () {},
          )
        ],
        title: Transform(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: const Text(
              "Activities",
              style: AppTheme.headline,
            )),
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
              padding: const EdgeInsets.all(5),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(activity, style: AppTheme.subtitle2),
                        SizedBox(height: 20),
                        Row(children: [
                          Text('Time:', style: AppTheme.body2),
                          SizedBox(width: screenWidth * 0.03),
                          Text(time, style: AppTheme.body3),
                          SizedBox(width: screenWidth * 0.08),
                          Text('Intensity:', style: AppTheme.body2),
                          SizedBox(width: screenWidth * 0.03),
                          Text(intensity, style: AppTheme.body3),
                        ]),
                        SizedBox(
                            height: screenHeight * 0.65,
                            child: Column(children: [
                              Expanded(
                                  child: Scaffold(
                                      body: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                const SizedBox(height: 20),
                                                DefaultTabController(
                                                    length: 2,
                                                    initialIndex: 0,
                                                    child: Expanded(
                                                        child: NestedScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            headerSliverBuilder:
                                                                (context,
                                                                        innerBoxIsScrolled) =>
                                                                    [
                                                                      SliverToBoxAdapter(
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                              children: <Widget>[
                                                                            TabBar(
                                                                              labelColor: AppTheme.black,
                                                                              labelStyle: AppTheme.card7,
                                                                              unselectedLabelColor: AppTheme.grey,
                                                                              tabs: activityTabs,
                                                                            ),
                                                                          ]))
                                                                    ],
                                                            body: Container(
                                                                height: 300,
                                                                decoration: const BoxDecoration(
                                                                    border: Border(
                                                                        top: BorderSide(
                                                                            color: Colors
                                                                                .grey,
                                                                            width:
                                                                                0.5))),
                                                                child: SizedBox(
                                                                    height: 300,
                                                                    child: TabBarView(
                                                                        children: <
                                                                            Widget>[
                                                                          ActivityTimer(
                                                                              inputTime: time),
                                                                          SingleChildScrollView(
                                                                              child: InstructionsList(instructionsList: instructionsList)),
                                                                        ]))))))
                                              ])))),
                            ])),
                        SizedBox(height: 20),
                        Center(
                            child: Container(
                                width: 200,
                                height: 30,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        minimumSize: const Size.fromHeight(10),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(5),
                                        primary: AppTheme.darkGrey,
                                        textStyle: AppTheme.body2,
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.arrow_back_ios_sharp,
                                              color: AppTheme.darkGrey,
                                              size: 15),
                                          SizedBox(width: 10),
                                          Text('Back to activities list')
                                        ]),
                                    onPressed: () {
                                      (Navigator.pop(context));
                                    })))
                      ])))
        ],
      ),
    );
  }
}

class ActivityTimer extends StatefulWidget {
  final String inputTime;

  const ActivityTimer({Key? key, required this.inputTime}) : super(key: key);

  @override
  _ActivityTimerState createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  late int startTime;
  final CustomTimerController _controller = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    startTime = int.parse(widget.inputTime.replaceAll(RegExp(r'[^0-9]'), ''));

    return Column(children: [
      SizedBox(height: screenHeight * 0.1),
      Container(
          height: screenHeight*0.6,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.darkPurple,
                  AppTheme.lightPurple,
                ],
                tileMode: TileMode.clamp),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: CustomTimer(
              controller: _controller,
              begin: Duration(minutes: startTime),
              end: const Duration(minutes: 0),
              builder: (CustomTimerRemainingTime remaining) {
                return Text(
                  "${remaining.minutes}:${remaining.seconds}",
                  style: const TextStyle(fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                    letterSpacing: -0.05,
                    color: AppTheme.white),
                );
              },
            ),
          )),
      SizedBox(height: screenHeight * 0.1),
      Container(
          width: screenWidth * 0.9,
          child: Row(children: [
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(10),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  primary: AppTheme.white,
                  textStyle: AppTheme.subtitle,
                  backgroundColor: AppTheme.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Start')]),
              onPressed: () => _controller.start(),
            )),
            SizedBox(width: 10),
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(10),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  primary: AppTheme.white,
                  textStyle: AppTheme.subtitle,
                  backgroundColor: AppTheme.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Pause')]),
              onPressed: () => _controller.pause(),
            )),
            SizedBox(width: 10),
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(10),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  primary: AppTheme.white,
                  textStyle: AppTheme.subtitle,
                  backgroundColor: AppTheme.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Reset')]),
              onPressed: () => _controller.reset(),
            ))
          ]))
    ]);
  }
}

class InstructionsList extends StatelessWidget {
  final String instructionsList;

  const InstructionsList({Key? key, required this.instructionsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(instructionsList, style: AppTheme.body3));
  }
}
