import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'custom_components/gradient_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int index) changePage;

  const HomeScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              GradientAppBar('Welcome'), Container(),
              SingleChildScrollView(
                  padding: const EdgeInsets.all(5), // padding above item cards
                  child: Column(children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      // padding either side of item cards
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: AppTheme.darkPurple, width: 10),
                                        ),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.all(15.0),
                                          primary: AppTheme.black,
                                          textStyle: AppTheme.subtitle,
                                          backgroundColor: AppTheme.white,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text('Activity',
                                                  style: AppTheme.card1),
                                              Text(
                                                  'Choose a standing activity to complete',
                                                  style: AppTheme.card2)
                                            ]),
                                        onPressed: () {
                                          changePage(AppTheme.ACTIVITYSCREEN);
                                        },
                                      )),
                                ]),
                            const SizedBox(
                                height: 15,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: AppTheme.lightGrey))),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: AppTheme.darkPurple, width: 10),
                                        ),
                                      ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Statistics',
                                              style: AppTheme.card1),
                                          Text(
                                              'View your data and trends in activity',
                                              style: AppTheme.card2)
                                        ]),
                                    onPressed: () {
                                      changePage(AppTheme.STATISTICSSCREEN);
                                    },
                                  )),
                                ]),
                            const SizedBox(
                                height: 15,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: AppTheme.lightGrey))),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: AppTheme.darkPurple, width: 10),
                                        ),
                                      ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Tips', style: AppTheme.card1),
                                          Text(
                                              'See tips for a healthy work environment',
                                              style: AppTheme.card2)
                                        ]),
                                    onPressed: () {
                                      changePage(AppTheme.TIPSSCREEN);
                                    },
                                  )),
                                ]),
                            const SizedBox(
                                height: 15,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: AppTheme.lightGrey))),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: AppTheme.darkPurple, width: 10),
                                        ),
                                      ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Settings',
                                              style: AppTheme.card1),
                                          Text(
                                              'View your personal profile and settings',
                                              style: AppTheme.card2)
                                        ]),
                                    onPressed: () {
                                      changePage(AppTheme.SETTINGSSCREEN);
                                    },
                                  ))
                                ])
                          ]),
                      //decoration: const BoxDecoration(color: AppTheme.white)
                    )
                  ])),
              //_pages.elementAt(_pageIndex)],
            ]
      ),
    );
  }
}
