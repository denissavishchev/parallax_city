import 'package:flutter/material.dart';
import 'package:parallax_city/constants.dart';

import 'custom_widgets/body_widget.dart';

class ParallaxWidget extends StatefulWidget {
  const ParallaxWidget({Key? key}) : super(key: key);

  @override
  State<ParallaxWidget> createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {

  double topTwelve = 0;
  double topEleven = 0;
  double topTen = 0;
  double topNine = 0;
  double topEight = 0;
  double topSeven = 0;
  double topSix = 0;
  double topFive = 0;
  double topFour = 0;
  double topThree = 0;
  double topTwo = 0;
  double topOne = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kDarkPurple,
        body: NotificationListener(
          onNotification: (notif) {
            if (notif is ScrollUpdateNotification) {
              if (notif.scrollDelta == null) return true;
              setState(() {
                topTwelve -= notif.scrollDelta! / 2.6;
                topEleven -= notif.scrollDelta! / 2.5;
                topTen -= notif.scrollDelta! / 2.4;
                topNine -= notif.scrollDelta! / 2.3;
                topEight -= notif.scrollDelta! / 2.2;
                topSeven -= notif.scrollDelta! / 2.1;
                topSix -= notif.scrollDelta! / 2.0;
                topFive -= notif.scrollDelta! / 1.8;
                topFour -= notif.scrollDelta! / 1.6;
                topThree -= notif.scrollDelta! / 1.4;
                topTwo -= notif.scrollDelta! / 1.2;
                topOne -= notif.scrollDelta! / 1.0;
              });
            }
            return true;
          },
          child: Stack(
            children: [
              Parallax(top: topTwelve, asset: 'assets/images/12.png'),
              Parallax(top: topEleven, asset: 'assets/images/11.png'),
              Parallax(top: topTen, asset: 'assets/images/10.png'),
              Parallax(top: topNine, asset: 'assets/images/9.png'),
              Parallax(top: topEight, asset: 'assets/images/8.png'),
              Parallax(top: topSeven, asset: 'assets/images/7.png'),
              Parallax(top: topSix, asset: 'assets/images/6.png'),
              Parallax(top: topFive, asset: 'assets/images/5.png'),
              Parallax(top: topFour, asset: 'assets/images/4.png'),
              Parallax(top: topThree, asset: 'assets/images/3.png'),
              Parallax(top: topTwo, asset: 'assets/images/2.png'),
              Parallax(top: topOne, asset: 'assets/images/1.png'),
              const SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: BodyWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Parallax extends StatelessWidget {
  const Parallax({Key? key,
    this.top,
    required this.asset
  }) : super(key: key);

  final double? top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
        left: 0,
        right: -40,
        child: SizedBox(
          height: 240,
          child: Image(
            image: AssetImage(asset),
            fit: BoxFit.fitWidth,
          ),
        ));
  }
}
