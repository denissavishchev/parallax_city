import 'package:flutter/material.dart';

import 'body_widget.dart';

class ParallaxWidget extends StatefulWidget {
  const ParallaxWidget({Key? key}) : super(key: key);

  @override
  State<ParallaxWidget> createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {

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
        body: NotificationListener(
          onNotification: (notif) {
            if (notif is ScrollUpdateNotification) {
              if (notif.scrollDelta == null) return true;
              setState(() {
                topSix -= notif.scrollDelta! / 2.8;
                topFive -= notif.scrollDelta! / 2.5;
                topFour -= notif.scrollDelta! / 2.2;
                topThree -= notif.scrollDelta! / 1.9;
                topTwo -= notif.scrollDelta! / 1.6;
                topOne -= notif.scrollDelta! / 1.2;
              });
            }
            return true;
          },
          child: Stack(
            children: [
              Parallax(top: topSix, asset: 'assets/images/s6.png'),
              Parallax(top: topFive, asset: 'assets/images/s5.png'),
              Parallax(top: topFour, asset: 'assets/images/s4.png'),
              Parallax(top: topThree, asset: 'assets/images/s3.png'),
              Parallax(top: topTwo, asset: 'assets/images/s2.png'),
              Parallax(top: topOne, asset: 'assets/images/s1.png'),
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
        right: 0,
        child: SizedBox(
          height: 500,
          child: Image(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ));
  }
}
