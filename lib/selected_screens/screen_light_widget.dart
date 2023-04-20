import 'package:flutter/material.dart';
import 'package:parallax_city/constants.dart';

class ScreenLightWidget extends StatefulWidget {
  const ScreenLightWidget({Key? key}) : super(key: key);

  @override
  State<ScreenLightWidget> createState() => _ScreenLightWidgetState();
}

class _ScreenLightWidgetState extends State<ScreenLightWidget> {
  double _sliderLightRoom = 0;
  bool _switchLightRoom = true;
  TimeOfDay _timeRoomStart = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _timeRoomEnd = const TimeOfDay(hour: 00, minute: 00);

  double _sliderLightKitchen = 0;
  bool _switchLightKitchen = true;
  TimeOfDay _timeKitchenStart = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _timeKitchenEnd = const TimeOfDay(hour: 00, minute: 00);

  double _sliderLightBed = 0;
  bool _switchLightBed = true;
  TimeOfDay _timeBedStart = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _timeBedEnd = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    final timeRoomStartHour = _timeRoomStart.hour.toString().padLeft(2, '0');
    final timeRoomStartMin = _timeRoomStart.minute.toString().padLeft(2, '0');
    final timeRoomEndHour = _timeRoomEnd.hour.toString().padLeft(2, '0');
    final timeRoomEndMin = _timeRoomEnd.minute.toString().padLeft(2, '0');

    final timeKitchenStartHour = _timeKitchenStart.hour.toString().padLeft(2, '0');
    final timeKitchenStartMin = _timeKitchenStart.minute.toString().padLeft(2, '0');
    final timeKitchenEndHour = _timeKitchenEnd.hour.toString().padLeft(2, '0');
    final timeKitchenEndMin = _timeKitchenEnd.minute.toString().padLeft(2, '0');

    final timeBedStartHour = _timeBedStart.hour.toString().padLeft(2, '0');
    final timeBedStartMin = _timeBedStart.minute.toString().padLeft(2, '0');
    final timeBedEndHour = _timeBedEnd.hour.toString().padLeft(2, '0');
    final timeBedEndMin = _timeBedEnd.minute.toString().padLeft(2, '0');

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Room',
                      style: TextStyle(
                          color: kDarkText,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeRoomStart,);
                      if (newTime == null) return;
                      setState(() {
                        _timeRoomStart = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeRoomStartHour:$timeRoomStartMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeRoomEnd);
                      if (newTime == null) return;
                      setState(() {
                        _timeRoomEnd = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeRoomEndHour:$timeRoomEndMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Switch.adaptive(
                      value: _switchLightRoom,
                      activeColor: kLightPurple,
                      inactiveTrackColor: kLightPurple.withOpacity(0.3),
                      inactiveThumbColor: kLightPurple.withOpacity(0.3),
                      onChanged: (bool value) {
                        setState(() {
                          _switchLightRoom = value;
                        });
                      }),
                ],
              ),
              Slider.adaptive(
                  min: 0,
                  max: 100,
                  value: _sliderLightRoom,
                  divisions: 100,
                  activeColor: kLightPurple,
                  inactiveColor: kLightPurple.withOpacity(0.3),
                  onChanged: (double value) {
                    setState(() {
                      _sliderLightRoom = value;
                    });
                  }),
              Divider(thickness: 1, color: kLightPurple.withOpacity(0.5),),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Kitchen',
                      style: TextStyle(
                          color: kDarkText,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeKitchenStart);
                      if (newTime == null) return;
                      setState(() {
                        _timeKitchenStart = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeKitchenStartHour:$timeKitchenStartMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeKitchenEnd);
                      if (newTime == null) return;
                      setState(() {
                        _timeKitchenEnd = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeKitchenEndHour:$timeKitchenEndMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Switch.adaptive(
                      value: _switchLightKitchen,
                      activeColor: kLightPurple,
                      inactiveTrackColor: kLightPurple.withOpacity(0.3),
                      inactiveThumbColor: kLightPurple.withOpacity(0.3),
                      onChanged: (bool value) {
                        setState(() {
                          _switchLightKitchen = value;
                        });
                      }),
                ],
              ),
              Slider.adaptive(
                  min: 0,
                  max: 100,
                  value: _sliderLightKitchen,
                  divisions: 100,
                  activeColor: kLightPurple,
                  inactiveColor: kLightPurple.withOpacity(0.3),
                  onChanged: (double value) {
                    setState(() {
                      _sliderLightKitchen = value;
                    });
                  }),
              Divider(thickness: 1, color: kLightPurple.withOpacity(0.5),),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      'Bedroom',
                      style: TextStyle(
                          color: kDarkText,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeBedStart);
                      if (newTime == null) return;
                      setState(() {
                        _timeBedStart = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeBedStartHour:$timeBedStartMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: _timeBedEnd);
                      if (newTime == null) return;
                      setState(() {
                        _timeBedEnd = newTime;
                      });
                    },
                    style: timeButtonStyle,
                    child: Text(
                      '$timeBedEndHour:$timeBedEndMin',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Switch.adaptive(
                      value: _switchLightBed,
                      activeColor: kLightPurple,
                      inactiveTrackColor: kLightPurple.withOpacity(0.3),
                      inactiveThumbColor: kLightPurple.withOpacity(0.3),
                      onChanged: (bool value) {
                        setState(() {
                          _switchLightBed = value;
                        });
                      }),
                ],
              ),
              Slider.adaptive(
                  min: 0,
                  max: 100,
                  value: _sliderLightBed,
                  divisions: 100,
                  activeColor: kLightPurple,
                  inactiveColor: kLightPurple.withOpacity(0.3),
                  onChanged: (double value) {
                    setState(() {
                      _sliderLightBed = value;
                    });
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
