import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(
      this.questionText); //Taking external inputs/input data for the widget via the constructor.Same as questionText = this.questionText
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),//10px of margins along the edges of the containers
      child:Text(
      questionText,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    )
    );
  }
}
