import 'package:flutter/material.dart';
import '../app_theme.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 200.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView(
              children: [const SizedBox(height: 15), Container(alignment: Alignment.topRight, child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: Image.asset('assets/images/logo.png', height: 50, width: 50),
              )), Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Welcome',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        letterSpacing: 0.27,
                        color: AppTheme.white,),
                    ),
                    Text(
                      'What would you like to do?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: -0.04,
                        color: AppTheme.white,),
                    ),
                  ]
              )]),
            ),
            //),
            //)
          ],
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppTheme.darkPurple,
              AppTheme.lightPurple,
            ],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}