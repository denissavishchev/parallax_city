import 'package:flutter/material.dart';

class ScreenHeatWidget extends StatelessWidget {
  const ScreenHeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text('Heat'),
      ),
    );
  }
}