import 'package:flutter/material.dart';
import 'package:parallax_city/selected_screens/screen_bath_widget.dart';
import 'package:parallax_city/selected_screens/screen_clock_widget.dart';
import 'package:parallax_city/selected_screens/screen_fan_widget.dart';
import 'package:parallax_city/selected_screens/screen_gears_widget.dart';
import 'package:parallax_city/selected_screens/screen_heat_widget.dart';
import 'package:parallax_city/selected_screens/screen_light_widget.dart';
import 'package:parallax_city/selected_screens/screen_lock_widget.dart';
import 'package:parallax_city/selected_screens/screen_sound_widget.dart';
import 'package:parallax_city/selected_screens/screen_term_widget.dart';
import 'package:parallax_city/selected_screens/screen_tv_widget.dart';
import 'package:parallax_city/selected_screens/screen_wifi_widget.dart';
import 'package:parallax_city/selected_screens/screen_window_widget.dart';

import '../constants.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key,}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final List buttons = [
    'bulb',
    'bath',
    'clock',
    'fan',
    'gears',
    'heat',
    'lock',
    'sound',
    'term',
    'tv',
    'wifi',
    'window',
  ];

  int selected = 0;

  Widget selectedWidget = const ScreenLightWidget();

  void selectedScreen() {
    if (selected == 0) {
      selectedWidget = const ScreenLightWidget();
    }else if (selected == 1) {
      selectedWidget = const ScreenBathWidget();
    }else if (selected == 2) {
      selectedWidget = const ScreenClockWidget();
    }else if (selected == 3) {
      selectedWidget = const ScreenFanWidget();
    }else if (selected == 4) {
      selectedWidget = const ScreenGearsWidget();
    }else if (selected == 5) {
      selectedWidget = const ScreenHeatWidget();
    }else if (selected == 6) {
      selectedWidget = const ScreenLockWidget();
    }else if (selected == 7) {
      selectedWidget = const ScreenSoundWidget();
    }else if (selected == 8) {
      selectedWidget = const ScreenTermWidget();
    }else if (selected == 9) {
      selectedWidget = const ScreenTVWidget();
    }else if (selected == 10) {
      selectedWidget = const ScreenWiFiWidget();
    }else if (selected == 11) {
      selectedWidget = const ScreenWindowWidget();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: kDarkPurple,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 10),
                itemCount: buttons.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Center(
                      child: GestureDetector(
                    onTap: () => setState(
                      () {
                        selected = index;
                        selectedScreen();
                      },
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 61,
                          height: 61,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(31))),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceOut,
                          margin: index == selected
                              ? const EdgeInsets.fromLTRB(0.5, 0, 1, 1)
                              : const EdgeInsets.all(0.5),
                          padding: const EdgeInsets.all(12),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: index == selected
                                  ? Colors.transparent
                                  : kLightPurple,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: index == selected
                                      ? const Offset(0, 2)
                                      : const Offset(4, 8),
                                ),
                                BoxShadow(
                                  color: index == selected
                                      ? Colors.black.withOpacity(0.9)
                                      : Colors.transparent,
                                ),
                                BoxShadow(
                                  color: index == selected
                                      ? kDark
                                      : Colors.transparent,
                                  spreadRadius: -2.0,
                                  blurRadius: 10.0,
                                ),
                                BoxShadow(
                                  color: index == selected
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.transparent,
                                  spreadRadius: -15.0,
                                  blurRadius: 8.0,
                                ),
                              ]),
                          child:
                              Image.asset('assets/icons/${buttons[index]}.png'),
                        ),
                      ],
                    ),
                  ));
                }),
          ),
          Expanded(
            child: IndexedStack(
              index: selected,
              children: List.generate(
                buttons.length,
                (index) => AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  bottom: selected == index ? 0 : -500,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.63,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: selectedWidget,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
