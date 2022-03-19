import 'package:flutter/material.dart';
import 'package:stand_up_2/app_theme.dart';

class NoiseTipsScreen extends StatelessWidget {
  final void Function(int index) changePage;
  const NoiseTipsScreen({Key? key, required this.changePage}) : super(key: key);

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
                              child: const CircleAvatar(child: Icon(Icons.volume_up_outlined, color: AppTheme.white), backgroundColor: Colors.transparent),
                            ),
                            const SizedBox(width:10),
                            const Text('Noise', style: AppTheme.card1),]),
                            const SizedBox(height: 20,),
                          Container(padding: const EdgeInsets.all(15),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              Text('Visitors', style: AppTheme.card7),
                              Text('Try to have a dedicated personal home office space. Set clear working hours with those you live with to avoid being disrupted.', style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Headphones', style: AppTheme.card7),
                              Text("Wearing headphones whilst you're working can help to reduce background noise. In addition, noise cancelling headphones can go a long way in helping you to maintain your focus.", style: AppTheme.body1),
                              SizedBox(height: 20,),
                              Text('Time', style: AppTheme.card7),
                              Text('Some sounds can be masked simply by introducing white noise into your home office space. Try using a noise-cancelling app or even installing a dedicated white noise system into your room.', style: AppTheme.body1)
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