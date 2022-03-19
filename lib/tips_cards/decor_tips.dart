import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';

class DecorTipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const DecorTipsScreen({Key? key, required this.changePage}) : super(key: key);

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
                              child: const CircleAvatar(child: Icon(Icons.format_paint_outlined, color: AppTheme.white), backgroundColor: Colors.transparent),
                            ),
                            const SizedBox(width:10),
                            const Text('Decor', style: AppTheme.card1),]),
                            const SizedBox(height: 20,),
                          Container(padding: const EdgeInsets.all(15),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              Text('Plants', style: AppTheme.card7),
                              Text('Introducing plants into your office space can bring additional colour into the room and improve air quality, helping you to focus more during the day.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Soft Furnishings', style: AppTheme.card7),
                              Text('Adding soft furnishings such as carpet, curtains and soft decorations can help to create a quieter and more comfortable work environment.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Desk Organisation', style: AppTheme.card7),
                              Text('Desk Organisers such as pencil holders, baskets and filing folders can help to declutter your workspace and organise any important paperwork for later reference.', style: AppTheme.body1)
                            ]))
                          ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 200, height: 30, child: TextButton(
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