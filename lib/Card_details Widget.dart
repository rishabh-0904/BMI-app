import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class Card_Details extends StatelessWidget {
  Card_Details({this.icon, this.txt});
  // const Card_Details({
  //   Key key,
  // }) : super(key: key);
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          // FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          txt,
          // 'MALE',
          style: txtstyle,
        )
      ],
    );
  }
}
