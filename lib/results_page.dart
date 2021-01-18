import 'package:bmi_calculator/icon_contents.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kBigLabelTextStyle.copyWith(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              child: BMIResult(
                result: brain.getResult(),
                reading: brain.BMI().toStringAsFixed(1),
                summary: brain.getSummary(),
              ),
              color: kActiveCardColor,
              ontap: () {},
            ),
          ),
          ReusableButton(
            ontap: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
