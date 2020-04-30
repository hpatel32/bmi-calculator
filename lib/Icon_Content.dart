import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.gender, this.iconD});

  final String gender;
  final IconData iconD;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconD,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(gender, style: kTextStyle),
      ],
    );
  }
}
