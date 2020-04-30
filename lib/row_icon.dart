import 'package:flutter/material.dart';

class RowIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RowIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
