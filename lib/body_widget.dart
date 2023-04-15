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
          height: 500,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              'Night City',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ButtonWidget(),
      ],
    );
  }
}
