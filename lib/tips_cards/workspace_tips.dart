import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';

class WorkspaceTipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const WorkspaceTipsScreen({Key? key, required this.changePage}) : super(key: key);

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
                              child: const CircleAvatar(child: Icon(Icons.computer, color: AppTheme.white), backgroundColor: Colors.transparent),
                            ),
                            const SizedBox(width:10),
                            const Text('Workspace', style: AppTheme.card1),]),
                            const SizedBox(height: 20,),
                          Container(padding: const EdgeInsets.all(15),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              Text('Desktop', style: AppTheme.card7),
                              Text('Your desktop should be clear and well organised. Make sure the only work in front of you is critical to your current task.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Storage', style: AppTheme.card7),
                              Text('Make sure you have adequate storage including shelving and drawers to keep everything tidy and out of sight. Try to form a habit of packing everything away again at the end of the day.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Time', style: AppTheme.card7),
                              Text('Hanging a clock on the wall can reduce the chance that you lose track of the time. This can also help you to take breaks promptly by reminding you of how much time has passed.', style: AppTheme.body1)
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