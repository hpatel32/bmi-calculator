import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String buttonTitle;

  BottomButton({this.buttonTitle, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonStyle,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomHeight,
      ),
    );
  }
}
