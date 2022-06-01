import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../app_theme.dart';

class StatisticsScreen extends StatelessWidget {
  final void Function(int index) changePage;

  const StatisticsScreen({Key? key, required this.changePage}) : super(key: key);

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
              onPressed: () {
                changePage(AppTheme.HOMEPAGE);
              },
            )
          ],
          title: const Text(
            "Statistics",
            style: AppTheme.headline,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
            child: Scaffold(body: Center(child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
              Column(children: [
                const SizedBox(height: 20),
                Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const Text('Overview',
                                      style: AppTheme.subtitle3),
                                  const SizedBox(height: 20),
                                  Container(
                                      //height: screenHeight * 0.25,
                                      padding: EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Text('Total Sitting Time',
                                                style: AppTheme.body2),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const CoverLineChart(),
                                      ])),
                                  const SizedBox(height: 20),
                                  const Text('Breakdown & Trends',
                                      style: AppTheme.subtitle3),
                                  const SizedBox(height: 20),
                                  Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: Column(
                                          children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                          Container(
                                            height: 20, width: 20,
                                            decoration: const BoxDecoration(
                                              color: AppTheme.lightPurple,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                            child: Text(" "),
                                              ),
                                          SizedBox(width:screenWidth*0.02),
                                          Center(child: Text('Standing',style:AppTheme.body3)),
                                          SizedBox(width:screenWidth*0.05),
                                          Container(
                                            height: 20, width: 20,
                                            decoration: const BoxDecoration(
                                              color: AppTheme.pink,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),
                                            child: Text(" "),
                                          ),
                                          SizedBox(width:screenWidth*0.02),
                                          Center(child: Text('Sitting',style:AppTheme.body3)),
                                              SizedBox(width:screenWidth*0.02),
                                            ]
                                        ),
                                        const CompBarChart(),
                                      ]))
                                ]))
              ])
            ])))));
  }
}

class CoverLineChart extends StatefulWidget {
  const CoverLineChart({Key? key}) : super(key: key);

  @override
  _CoverLineChartState createState() => _CoverLineChartState();
}

class _CoverLineChartState extends State<CoverLineChart> {
  List<Color> gradientColors = [
    AppTheme.blue,
    AppTheme.lightPurple
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: AppTheme.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                  showAvg ? AppTheme.darkGrey.withOpacity(0.5) : AppTheme.darkGrey),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppTheme.lightGrey,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppTheme.lightGrey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mon';
              case 3:
                return 'Tue';
              case 5:
                return 'Wed';
              case 7:
                return 'Thu';
              case 9:
                return 'Fri';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '0h';
              case 3:
                return '4h';
              case 5:
                return '8h';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color:AppTheme.lightGrey, width: 1)),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.36, 2),
            FlSpot(4.45, 5),
            FlSpot(6.18, 3.1),
            FlSpot(7.27, 4),
            FlSpot(8.64, 3),
            FlSpot(10, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppTheme.lightGrey,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppTheme.lightGrey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mon';
              case 3:
                return 'Tue';
              case 5:
                return 'Wed';
              case 7:
                return 'Thu';
              case 9:
                return 'Fri';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '0h';
              case 3:
                return '4h';
              case 5:
                return '8h';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: AppTheme.lightGrey, width: 1)),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.36, 3.44),
            FlSpot(4.45, 3.44),
            FlSpot(6.18, 3.44),
            FlSpot(7.27, 3.44),
            FlSpot(8.64, 3.44),
            FlSpot(10, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}

class CompBarChart extends StatefulWidget {
  const CompBarChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompBarChartState();
}

class CompBarChartState extends State<CompBarChart> {
  final Color leftBarColor = AppTheme.lightPurple;
  final Color rightBarColor = AppTheme.pink;
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 4, 8);
    final barGroup2 = makeGroupData(1, 8, 4);
    final barGroup3 = makeGroupData(2, 3, 6);
    final barGroup4 = makeGroupData(3, 6, 7);
    final barGroup5 = makeGroupData(4, 7, 2);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: AppTheme.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: 10,
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (_a, _b, _c, _d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          if (response == null || response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroups = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (var rod
                              in showingBarGroups[touchedGroupIndex]
                                  .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroups[touchedGroupIndex].copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .map((rod) {
                                      return rod.copyWith(toY: avg);
                                    }).toList(),
                                  );
                            }
                          });
                        }),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        margin: 20,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mon';
                            case 1:
                              return 'Tue';
                            case 2:
                              return 'Wed';
                            case 3:
                              return 'Thu';
                            case 4:
                              return 'Fri';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        margin: 8,
                        reservedSize: 28,
                        interval: 1,
                        getTitles: (value) {
                          if (value == 0) {
                            return '0h';
                          } else if (value == 4) {
                            return '4h';
                          } else if (value == 8) {
                            return '8h';
                          } else {
                            return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }
}