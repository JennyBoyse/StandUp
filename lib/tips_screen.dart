import 'package:flutter/material.dart';
import 'package:stand_up_2/tips_cards/ergonomics_tips.dart';
import 'package:stand_up_2/tips_cards/lighting_tips.dart';
import 'app_theme.dart';

class TipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const TipsScreen({Key? key, required this.changePage}) : super(key: key);

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
        title: const Text("Tips", style: AppTheme.headline,),
        backgroundColor: Colors.transparent, elevation: 0.0,),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
              padding: const EdgeInsets.all(5), // padding above item cards
              child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // padding either side of item cards
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(40),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                                      Text('Lighting', style: AppTheme.card1),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios, color: AppTheme.lightGrey)]),
                                    onPressed: (){(Navigator.push(context, MaterialPageRoute(builder: (context) => LightingTipsScreen(changePage: changePage,)),));},
                                  ),),
                                ]
                            ),
                            const SizedBox(height: 30, child: DecoratedBox(decoration: BoxDecoration(color: AppTheme.lightGrey))),
                            Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                                        Text('Ergonomics', style: AppTheme.card1),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, color: AppTheme.lightGrey)]),
                                    onPressed: (){(Navigator.push(context, MaterialPageRoute(builder: (context) => ErgonomicsTipsScreen(changePage: changePage,)),));},
                                  ),),
                                ]
                            ),
                            const SizedBox(height: 30, child: DecoratedBox(decoration: BoxDecoration(color: AppTheme.lightGrey))),
                            Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                    child: const CircleAvatar(child: Icon(Icons.computer, color: AppTheme.white), backgroundColor: Colors.transparent),
                                  ),
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                                        Text('Workspace', style: AppTheme.card1),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, color: AppTheme.lightGrey)]),
                                    onPressed: (){changePage(AppTheme.HOMEPAGE);},
                                  ),),
                                ]
                            ),
                            const SizedBox(height: 30, child: DecoratedBox(decoration: BoxDecoration(color: AppTheme.lightGrey))),
                            Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                    child: const CircleAvatar(child: Icon(Icons.volume_up_outlined, color: AppTheme.white), backgroundColor: Colors.transparent),
                                  ),
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                                        Text('Noise', style: AppTheme.card1),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, color: AppTheme.lightGrey)]),
                                    onPressed: (){changePage(AppTheme.HOMEPAGE);},
                                  ),),
                                ]
                            ),
                            const SizedBox(height: 30, child: DecoratedBox(decoration: BoxDecoration(color: AppTheme.lightGrey))),
                            Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                    child: const CircleAvatar(child: Icon(Icons.format_paint_outlined, color: AppTheme.white), backgroundColor: Colors.transparent),
                                  ),
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(15.0),
                                      primary: Colors.black,
                                      textStyle: AppTheme.subtitle,
                                      backgroundColor: AppTheme.white,
                                    ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                                        Text('Decor', style: AppTheme.card1),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios, color: AppTheme.lightGrey)]),
                                    onPressed: (){changePage(AppTheme.HOMEPAGE);},
                                  ),),
                                ]
                            ),
                          ]),
                      //decoration: const BoxDecoration(color: AppTheme.white)
                    )]
              )
          ),
        ],
      ),
    );
  }
}