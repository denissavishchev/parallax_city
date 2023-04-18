import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenBathWidget extends StatefulWidget {
  const ScreenBathWidget({Key? key}) : super(key: key);

  @override
  State<ScreenBathWidget> createState() => _ScreenBathWidgetState();
}

class _ScreenBathWidgetState extends State<ScreenBathWidget> {

  double _sliderLightBath = 0;
  bool _switchLightBath = true;
  TimeOfDay _timeWaterStart = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {

    final timeWaterStartHour = _timeWaterStart.hour.toString().padLeft(2, '0');
    final timeWaterStartMin = _timeWaterStart.minute.toString().padLeft(2, '0');

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 160,
                        child: Text('Will be ready by:',
                          style: TextStyle(
                              color: kDarkText,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                      ),
                      const SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context, initialTime: _timeWaterStart,);
                          if (newTime == null) return;
                          setState(() {
                            _timeWaterStart = newTime;
                          });
                        },
                        style:
                        ElevatedButton.styleFrom(backgroundColor: kDarkPurple),
                        child: Text(
                          '$timeWaterStartHour:$timeWaterStartMin',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 160,
                        child: Text('Water Temperature',
                          style: TextStyle(
                              color: kDarkText,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                      ),
                      Slider.adaptive(
                          min: 0,
                          max: 100,
                          value: _sliderLightBath,
                          divisions: 100,
                          activeColor: kLightPurple,
                          inactiveColor: kLightPurple.withOpacity(0.3),
                          onChanged: (double value) {
                            setState(() {
                              _sliderLightBath = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Light',
                              style: TextStyle(
                                  color: kDarkText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                            Switch.adaptive(
                                value: _switchLightBath,
                                activeColor: kLightPurple,
                                inactiveTrackColor: kLightPurple.withOpacity(0.3),
                                inactiveThumbColor: kLightPurple.withOpacity(0.3),
                                onChanged: (bool value) {
                                  setState(() {
                                    _switchLightBath = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Slider.adaptive(
                          min: 0,
                          max: 100,
                          value: _sliderLightBath,
                          divisions: 100,
                          activeColor: kLightPurple,
                          inactiveColor: kLightPurple.withOpacity(0.3),
                          onChanged: (double value) {
                            setState(() {
                              _sliderLightBath = value;
                            });
                          }),
                    ],
                  ),

                ],
              ),
            )),
      ),
    );
  }
}