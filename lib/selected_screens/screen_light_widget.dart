import 'package:flutter/material.dart';

class ScreenLightWidget extends StatefulWidget {
  ScreenLightWidget({Key? key}) : super(key: key);

  @override
  State<ScreenLightWidget> createState() => _ScreenLightWidgetState();
}

class _ScreenLightWidgetState extends State<ScreenLightWidget> {
  double _sliderValue = 0;
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Center(
            child: Column(
          children: [
            const Text('Light'),
            Slider.adaptive(
              min: 0,
                max: 100,
                value: _sliderValue,
                divisions: 100,
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.green,
                onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
                }),
            Container(
              width: 60,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Center(child: Text('$_sliderValue lux', style: const TextStyle(color: Colors.white),)),
            ),
            Switch.adaptive(
                value: _switch,
                activeColor: Colors.deepOrange,
                onChanged: (bool value) {
                  setState(() {
                    _switch = value;
                  });
                })
          ],
        )),
      ),
    );
  }
}
