import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Content.dart';
import 'Reusable_Card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'row_icon.dart';
import 'calculate_result.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int sliderHeight = 180;
  int weight = 40;
  int age = 15;
  void checkWeight(String action) {
    if (action == "add" && weight <= 150) {
      setState(() {
        weight++;
      });
    }
    if (action == "minus" && weight >= 1) {
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childWid: IconContent(
                          gender: "MALE",
                          iconD: FontAwesomeIcons.mars,
                        )),
                  ),
                  Expanded(
                    child: ReuseableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childWid: IconContent(
                          gender: "FEMALE",
                          iconD: FontAwesomeIcons.venus,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kActiveCardColor,
                childWid: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          sliderHeight.toString(),
                          style: kFontStyle,
                        ),
                        Text(
                          "cm",
                          style: kTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                      ),
                      child: Slider(
                        value: sliderHeight.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            sliderHeight = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      colour: kActiveCardColor,
                      childWid: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kFontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RowIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  checkWeight("minus");
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RowIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  checkWeight("add");
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      colour: kActiveCardColor,
                      childWid: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kFontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RowIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RowIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
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
            BottomButton(
              buttonTitle: "CALCULATE",
              ontap: () {
                CalculateResult calres =
                    CalculateResult(height: sliderHeight, weight: weight);
//                String res = calres.CalculateBMI();
//                String res1 = calres.getResult();
//                String res2 = calres.Interpretetion();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            getBMI: calres.CalculateBMI(),
                            getResult: calres.getResult(),
                            getInterp: calres.Interpretetion(),
                          )),
                );
              },
            ),
          ],
        ));
  }
}
