import 'package:flutter/material.dart';

class ScreenBathWidget extends StatelessWidget {
  const ScreenBathWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text('Bath'),
      ),
    );
  }
}