import 'package:flutter/material.dart';

class ScreenWiFiWidget extends StatelessWidget {
  const ScreenWiFiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text('WiFi'),
      ),
    );
  }
}