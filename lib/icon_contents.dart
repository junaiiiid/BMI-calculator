import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

final CalculatorBrain brain = CalculatorBrain();

class MaleFemaleChild extends StatelessWidget {
  final icon;
  final text;

  MaleFemaleChild({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSpace,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class HeightChild extends StatefulWidget {
  @override
  _HeightChildState createState() => _HeightChildState();
}

class _HeightChildState extends State<HeightChild> {
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'HEIGHT',
          style: kLabelTextStyle,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              height.toString(),
              style: kBigLabelTextStyle,
            ),
            Text(
              'cm',
              style: kLabelTextStyle,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            thumbColor: kButtonColor,
            activeTrackColor: Colors.white,
            overlayColor: Color(0x29EB1555),
            inactiveTrackColor: Color(0xff8d8e98),
          ),
          child: Slider(
            value: height.toDouble(),
            min: kMin.toDouble(),
            max: kMax.toDouble(),
            onChanged: (value) {
              brain.setHeight(value.toInt());

              setState(() {
                height = value.round();
              });
            },
          ),
        ),
      ],
    );
  }
}

class AgeWeightChild extends StatefulWidget {
  @override
  _AgeWeightChildState createState() => _AgeWeightChildState();

  final String text;
  final int max;
  final int min;
  int data;
  AgeWeightChild({this.text, this.max, this.min}) {
    data = min;
  }
}

class _AgeWeightChildState extends State<AgeWeightChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: kLabelTextStyle,
        ),
        Text(
          widget.data.toString(),
          style: kBigLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onpressed: () {
                setState(() {
                  brain.setWeight(widget.data);

                  widget.data == widget.min
                      ? widget.data = widget.min
                      : widget.data--;
                });
              },
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onpressed: () {
                setState(() {
                  brain.setWeight(widget.data);

                  widget.data == widget.max
                      ? widget.data = widget.min
                      : widget.data++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final icon;
  final onpressed;

  RoundIconButton({this.icon, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 2,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: kCircleColor,
      child: Icon(icon),
    );
  }
}

class ReusableButton extends StatelessWidget {
  final Function ontap;
  final String text;

  ReusableButton({this.ontap, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      color: kButtonColor,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80.0,
      child: GestureDetector(
        onTap: ontap,
        child: Center(
          child: Text(
            text,
            style: kBigLabelTextStyle.copyWith(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

class BMIResult extends StatelessWidget {
  final String result;
  final String reading;
  final String summary;

  BMIResult({this.result, this.reading, this.summary});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          result,
          textAlign: TextAlign.center,
          style: kBigLabelTextStyle.copyWith(
            fontSize: 25,
            color: Colors.green,
          ),
        ),
        Text(
          reading,
          textAlign: TextAlign.center,
          style: kBigLabelTextStyle.copyWith(fontSize: 80),
        ),
        Text(
          summary,
          textAlign: TextAlign.center,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
