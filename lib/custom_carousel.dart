import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'activities_screen.dart';
import 'app_theme.dart';
import 'breakpoints.dart';

class TopPicks extends StatelessWidget {
  final List<ActivityItem> activitiesList;
  late final List<Widget> activitySliders;
  final CarouselController _controller = CarouselController();
  final double customWidth;

  TopPicks({Key? key, required this.activitiesList, required this.customWidth}) : super(key: key) {
    activitySliders = activitiesList
        .map((item) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/activity_card_background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.darkPurple,
                  AppTheme.lightPurple,
                ],
                tileMode: TileMode.clamp
            ),
          ),
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                    Container(
                        width: customWidth,
                        padding: const EdgeInsets.only(top: 40.0, left: 8.0, right: 8.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Flexible(child: IconButton(
                                onPressed: () => _controller.previousPage(),
                                icon: const Icon(Icons.arrow_back_ios_rounded, color: AppTheme.white),
                            )),
                            Container(
                              width: customWidth * 0.6,
                              child: Column(children: <Widget>[
                                Text(item.activity, style: AppTheme.card4, textAlign: TextAlign.center,),
                                Text(item.time, style: AppTheme.card5,)]
                              ),
                            ),
                            Flexible(child: IconButton(
                                onPressed: () => _controller.nextPage(),
                                icon: const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.white))),
                          ])
                        ]
                      )
                    ),
                ],
              )),
        ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              children: <Widget>[CarouselSlider(
            options: CarouselOptions(aspectRatio: 2.0, enlargeCenterPage: true, scrollDirection: Axis.horizontal),
            items: activitySliders, carouselController: _controller
          )])),
    );
  }
}

class ActivitiesGrid extends StatelessWidget {

  const ActivitiesGrid({Key? key, required this.crossAxisCount, required this.activitiesList}) :
        assert(crossAxisCount == 1 || crossAxisCount == 2), super(key: key);
  final int crossAxisCount;
  final List<ActivityItem> activitiesList;

  @override
  Widget build(BuildContext context) {
    final rowSizes = List.generate(activitiesList.length ~/ crossAxisCount, (_) => auto);
    return LayoutGrid(
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr], // flexible column sizes based on crossAxisCount
      rowSizes: rowSizes, // self-sizing row height
      rowGap: 10, // equivalent to mainAxisSpacing
      columnGap: 5, //equivalent to crossAxisSpacing
      children: [
        for (var i = 0; i < activitiesList.length; i++)
          SelectCard(item: activitiesList[i]),
      ],
    );
  }
}
class SelectCard extends StatelessWidget{

  const SelectCard({Key? key, required this.item}) : super(key:key);
  final ActivityItem item;

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth >= Breakpoints.tablet ? 32.0 : 20.0;
    final verticalPadding = screenWidth >= Breakpoints.tablet ? 24.0 : 16.0;
    return Stack(
        alignment: Alignment.center,
          children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.18,
                    child: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: const BoxDecoration(
                            color: AppTheme.purple,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                        ),
                        child: item.image),),
                Container(
                      decoration: const BoxDecoration(
                        //image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(item.image),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      child: Card(
                        elevation: 8,
                        color: Colors.transparent,
                        child: Center(
                          //width: MediaQuery.of(context).size.height * .9,
                          //height: 220,
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                            Text(item.activity, style: AppTheme.card3),
                            Text(item.time, style: AppTheme.card6),])
                        )
                      ))
            ],
    );
  }
}