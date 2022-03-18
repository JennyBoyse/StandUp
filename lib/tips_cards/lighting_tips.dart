import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';

class LightingTipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const LightingTipsScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
        title: Transform(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: const Text("Tips", style: AppTheme.headline,)),
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.transparent, elevation: 0.0,),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
              padding: const EdgeInsets.all(5), // padding above item cards
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // padding either side of item cards
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                  Container(
                                    width: screenWidth * 0.9,
                                    padding: const EdgeInsets.all(15.0),
                                    decoration: const BoxDecoration(
                                      color: AppTheme.white,
                                    ),
                                      child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  AppTheme.darkPurple,
                                                  AppTheme.lightPurple,
                                                ],
                                                tileMode: TileMode.clamp
                                            ),
                                          ),
                                          child: const CircleAvatar(child: Icon(Icons.light, color: AppTheme.white), backgroundColor: Colors.transparent),
                                        ),
                                        const SizedBox(width:10),
                                        const Text('Lighting', style: AppTheme.card1),]),
                                        const SizedBox(height: 20,),
                                        Container(padding: const EdgeInsets.all(15),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('Natural Light', style: AppTheme.card7),
                                              Text('Good natural lighting can help to reduce eye strain and headaches when staring at a monitor for extended periods of time.', style: AppTheme.body1),
                                              SizedBox(height: 20,),
                                              Text('Additional Lighting', style: AppTheme.card7),
                                              Text('Invest in better artificial lighting when natural light is lacking. Consider general lighting, but also localised lighting for the areas where you complete your work tasks.', style: AppTheme.body1),
                                              SizedBox(height: 20,),
                                              Text('Blue Light', style: AppTheme.card7),
                                              Text("Screens can produce a lot of blue light, which can affect eye health, reduce sleep quality and cause eye strain. Try investing in a blue light filter, light blocking glasses or changing your screen's brightness and contrast.", style: AppTheme.body1)
                                          ]))
                                      ],
                                        ),
                                    ),
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(10),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                primary: AppTheme.white,
                                textStyle: AppTheme.subtitle,
                                backgroundColor: AppTheme.blue,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.arrow_back_ios_sharp, color: AppTheme.lightGrey),
                                  Text('Back to Tips')
                                ]
                              ),
                            onPressed: (){(Navigator.pop(context));})
                          ]
                      )
                    )
              )
        ],
      ),
    );
  }
}