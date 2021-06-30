import 'package:flutter/material.dart';

class CARD extends StatelessWidget {
  CARD({@required this.color, this.card_child});
  final Color color;
  final Widget card_child;
  // const CARD({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: card_child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
