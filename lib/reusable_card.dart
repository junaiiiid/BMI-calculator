import 'package:flutter/material.dart';
import 'gender.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final child;
  final ontap;

  ReusableCard({@required this.color, this.child, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
