import 'package:flutter/material.dart';

class ScreenSoundWidget extends StatelessWidget {
  const ScreenSoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text('Sound'),
      ),
    );
  }
}