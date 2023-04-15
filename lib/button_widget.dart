import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({
    Key? key,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff312f4a),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 10),
                itemCount: buttons.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Center(
                      child: GestureDetector(
                    onTap: () => setState(
                      () {
                        selected = index;
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
                                  : const Color(0xff443e60),
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
                                      ? const Color(0xff2a3348)
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
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Center(child: Text('${buttons[index]}')),
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
