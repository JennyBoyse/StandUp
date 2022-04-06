import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import '../pages/activities_screen.dart';
import '../pages/activity_subpage.dart';
import '../app_theme.dart';
import '../breakpoints.dart';

class TopPicks extends StatelessWidget {
  final List<ActivityItem> activitiesList;
  late final List<Widget> activitySliders;
  final CarouselController _controller = CarouselController();
  final double customWidth;

  TopPicks(
      {Key? key,
      required this.activitiesList,
      required this.customWidth,
      context})
      : super(key: key) {
    activitySliders = activitiesList
        .map((item) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/images/activity_card_background.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppTheme.darkPurple,
                      AppTheme.lightPurple,
                    ],
                    tileMode: TileMode.clamp),
              ),
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: customWidth,
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 8.0, right: 8.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActivitySubpage(
                                              activity: item.activity,
                                              time: item.time,
                                              intensity: item.intensity,
                                              instructionsList:
                                                  item.instructionsList,
                                            )));
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                              child: IconButton(
                                            onPressed: () =>
                                                _controller.previousPage(),
                                            icon: const Icon(
                                                Icons.arrow_back_ios_rounded,
                                                color: AppTheme.white),
                                          )),
                                          Container(
                                            width: customWidth * 0.6,
                                            child: Column(children: <Widget>[
                                              Text(
                                                item.activity,
                                                style: AppTheme.card8,
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                item.time,
                                                style: AppTheme.card5,
                                              )
                                            ]),
                                          ),
                                          Flexible(
                                              child: IconButton(
                                                  onPressed: () =>
                                                      _controller.nextPage(),
                                                  icon: const Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: AppTheme.white))),
                                        ])
                                  ]))),
                    ],
                  )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal),
            items: activitySliders,
            carouselController: _controller)
      ])),
    );
  }
}

class ActivitiesGrid extends StatefulWidget {
  const ActivitiesGrid(
      {Key? key, required this.crossAxisCount, required this.activitiesList})
      : assert(crossAxisCount == 1 || crossAxisCount == 2),
        super(key: key);

  final int crossAxisCount;
  final List<ActivityItem> activitiesList;

  @override
  _ActivitiesGridState createState() => _ActivitiesGridState();
}

class _ActivitiesGridState extends State<ActivitiesGrid> {
  late final List<String> items = [];

  final duplicateItems = List<String>.generate(activitiesList.length, (i) => activitiesList[i].activity);

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {dummyListData.add(item);}
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();

    final rowSizes =
        List.generate(activitiesList.length ~/ widget.crossAxisCount, (_) => auto);
    return Container(
        child: Column(
            children: <Widget>[
      const SizedBox(height: 15),
      LayoutGrid(
        columnSizes: widget.crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr, 1.fr],
        // flexible column sizes based on crossAxisCount
        rowSizes: rowSizes,
        // self-sizing row height
        rowGap: 10,
        // equivalent to mainAxisSpacing
        columnGap: 5,
        //equivalent to crossAxisSpacing
        children: [
          for (var i = 0; i < activitiesList.length; i++)
            SelectCard(item: activitiesList[i]),
        ],
      )
    ]));
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.item}) : super(key: key);
  final ActivityItem item;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth >= Breakpoints.tablet ? 32.0 : 20.0;
    final verticalPadding = screenWidth >= Breakpoints.tablet ? 24.0 : 16.0;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: 150,
            height: 140,
            padding: EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppTheme.darkPurple,
                    AppTheme.lightPurple,
                  ],
                  tileMode: TileMode.clamp),
            ),
            child: GestureDetector(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivitySubpage(
                                    activity: item.activity,
                                    time: item.time,
                                    intensity: item.intensity,
                                    instructionsList: item.instructionsList,
                                  )))
                    },
                child: Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: Stack(children: <Widget>[
                      Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: AppTheme.purple2,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                constraints: const BoxConstraints.expand(
                                  height: 40,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(item.imagePath),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.topLeft,
                                )),
                              ))),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item.activity,
                              style: AppTheme.card3,
                            ),
                            Text(item.time, style: AppTheme.card6),
                          ])
                    ]))))
      ],
    );
  }
}
