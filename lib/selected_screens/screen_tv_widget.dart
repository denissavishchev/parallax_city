import 'package:flutter/material.dart';

class ScreenTVWidget extends StatelessWidget {
  const ScreenTVWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text('TV'),
      ),
    );
  }
}