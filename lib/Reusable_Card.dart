import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color colour;
  final Widget childWid;
  final Function onPress;
  ReuseableCard({this.colour, this.childWid, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWid,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
