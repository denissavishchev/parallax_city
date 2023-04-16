import 'package:flutter/material.dart';

import 'button_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24),),
            color: Colors.grey,
          ),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Main Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ButtonWidget(),
      ],
    );
  }
}
