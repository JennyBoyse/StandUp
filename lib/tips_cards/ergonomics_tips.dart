import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';

class ErgonomicsTipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const ErgonomicsTipsScreen({Key? key, required this.changePage}) : super(key: key);

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
                              child: const CircleAvatar(child: Icon(Icons.chair_rounded, color: AppTheme.white), backgroundColor: Colors.transparent),
                            ),
                            const SizedBox(width:10),
                            const Text('Ergonomics', style: AppTheme.card1),]),
                            const SizedBox(height: 20,),
                          Container(padding: const EdgeInsets.all(15),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              Text('Chair', style: AppTheme.card7),
                              Text('A good office chair should have five castors, the ability to swivel as well as adjustable height and tilt, and back position.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Desk', style: AppTheme.card7),
                              Text('Ideally, a desk should alternate between sitting/standing positions. If not, its height should accommodate you without a footrest, and the surface should hold all equipment comfortably.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Accessories', style: AppTheme.card7),
                              Text('Ergonomics accessories like footrests, ergonomic keyboards/mice and anti-fatigue mats are advisable. Smaller changes like wearing comfortable shoes and staying conscious of sitting position can go along way.', style: AppTheme.body1)
                            ]))
                          ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: TextButton(
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
                                    Icon(Icons.arrow_back_ios_sharp, color: AppTheme.lightGrey, size: 15),
                                    SizedBox(width: 10),
                                    Text('Back to Tips')
                                  ]
                              ),
                              onPressed: (){(Navigator.pop(context));})))
                      ]
                  )
              )
          )
        ],
      ),
    );
  }
}