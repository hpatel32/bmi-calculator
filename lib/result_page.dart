import 'package:flutter/material.dart';
import 'constants.dart';
import 'Reusable_Card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.getBMI,
      @required this.getResult,
      @required this.getInterp});

  final String getBMI;
  final String getResult;
  final String getInterp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kActiveCardColor,
              childWid: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    getResult.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    getBMI,
                    style: kBMI,
                  ),
                  Text(
                    getInterp,
                    style: kBMIResultText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
