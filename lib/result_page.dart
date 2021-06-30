import 'package:bmi_calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmi_calculator/Cart_Widget.dart';

// class ResultsPage extends StatefulWidget {
//
//   @override
//   _ResultsPageState createState() => _ResultsPageState();
// }

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.result,
      @required this.message});
  final String bmiResult;
  final String result;
  final String message;
  // String wttype = 'OVERWEIGHT';
  // int bmi = 18;
  // String doctorrhega = 'You are helthy, good very good';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'BMI CALCULATOR',
        )),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      // backgroundColor: activeColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: CARD(
                    color: activeColor,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          result.toUpperCase(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmiResult,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 22.0,

                            // fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // MaterialPageRoute(builder: (contest) => ResultsPage()));
                },
                child: Container(
                  child: Container(
                    child: Center(
                      child: Text(
                        'RECALCULATE',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  color: bottom_Colour,
                  width: double.infinity,
                  height: bottom_container_height,
                ),
              )
            ]));
  }
}
