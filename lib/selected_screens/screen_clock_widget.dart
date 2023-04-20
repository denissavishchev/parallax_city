import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenClockWidget extends StatefulWidget {
  const ScreenClockWidget({Key? key}) : super(key: key);

  @override
  State<ScreenClockWidget> createState() => _ScreenClockWidgetState();
}

class _ScreenClockWidgetState extends State<ScreenClockWidget> {
  TimeOfDay _alarmOne = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _alarmTwo = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _alarmThree = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {

    final alarmOneHour = _alarmOne.hour.toString().padLeft(2, '0');
    final alarmOneMin = _alarmOne.minute.toString().padLeft(2, '0');
    final alarmTwoHour = _alarmTwo.hour.toString().padLeft(2, '0');
    final alarmTwoMin = _alarmTwo.minute.toString().padLeft(2, '0');
    final alarmThreeHour = _alarmThree.hour.toString().padLeft(2, '0');
    final alarmThreeMin = _alarmThree.minute.toString().padLeft(2, '0');

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
                      const Text(
                        'Alarms:',
                        style: TextStyle(
                            color: kDarkText,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: _alarmOne,
                          );
                          if (newTime == null) return;
                          setState(() {
                            _alarmOne = newTime;
                          });
                        },
                        style: timeButtonStyle,
                        child: Text(
                          '$alarmOneHour:$alarmOneMin',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: _alarmTwo,
                          );
                          if (newTime == null) return;
                          setState(() {
                            _alarmTwo = newTime;
                          });
                        },
                        style: timeButtonStyle,
                        child: Text(
                          '$alarmTwoHour:$alarmTwoMin',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: _alarmThree,
                          );
                          if (newTime == null) return;
                          setState(() {
                            _alarmThree = newTime;
                          });
                        },
                        style: timeButtonStyle,
                        child: Text(
                          '$alarmThreeHour:$alarmThreeMin',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )),
      ),
    );
  }
}