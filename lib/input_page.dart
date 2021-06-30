import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Card_details Widget.dart';
import 'package:bmi_calculator/Cart_Widget.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/calculation_part.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selcted_color;
  int height = 100;
  int weight = 70;
  int age = 20;
  // int height2 = 0;
  // Color male_clr = inactiveColor;
  // Color female_clr = inactiveColor;
  // void updateColour(Gender gender) {
  //   if (gender == Gender.male) {
  //     male_clr = (male_clr == inactiveColor) ? activeColor : inactiveColor;
  //     female_clr = inactiveColor;
  //   } else {
  //     female_clr = (female_clr == inactiveColor) ? activeColor : inactiveColor;
  //     male_clr = inactiveColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // its a function
                        setState(() {
                          selcted_color = Gender.male;
                          // updateColour(Gender.male);
                        });
                        print('MALE is chosen');
                      },
                      child: CARD(
                        color: selcted_color == Gender.male
                            ? activeColor
                            : inactiveColor,
                        card_child: Card_Details(
                          icon: FontAwesomeIcons.mars,
                          txt: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // its a function
                        setState(() {
                          selcted_color = Gender.female;
                          // updateColour(Gender.female);
                        });
                        print('FEMALE is chosen');
                      },
                      child: CARD(
                        color: selcted_color == Gender.female
                            ? activeColor
                            : inactiveColor,
                        card_child: Card_Details(
                          icon: FontAwesomeIcons.venus,
                          txt: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CARD(
                color: Color(0xff1d1e33),
                card_child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: txtstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: big_style,
                        ),
                        Text(
                          ' cm',
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        onChanged: (double newHeight) {
                          print(newHeight);
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0XFF8D8E98),
                        min: 120.0,
                        max: 220.0)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CARD(
                      color: Color(0xff1d1e33),
                      card_child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: txtstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: big_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(
                                    onPressed: (() {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                    backgroundColor: Colors.teal,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 10.0,
                                    )),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(
                                    onPressed: (() {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                                    backgroundColor: Colors.teal,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 10.0,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CARD(
                      color: Color(0xff1d1e33),
                      card_child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: txtstyle,
                          ),
                          Text(
                            age.toString(),
                            style: big_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(
                                    onPressed: (() {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                    backgroundColor: Colors.teal,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 10.0,
                                    )),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: FloatingActionButton(
                                    onPressed: (() {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                                    backgroundColor: Colors.teal,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 10.0,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator calc = Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contest) => ResultsPage(
                      bmiResult: calc.calculate(),
                      result: calc.getResult(),
                      message: calc.getMessage(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
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
          ],
        ));
  }
}
