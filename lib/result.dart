import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetquiz;
  Result(this.score,this.resetquiz);

  String get resultPhrase {
    var resultText = score>100?"You did it! You passed the test \n You scored: "+score.toString():"You failed!\nYou scored: "+score.toString();
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      RaisedButton(child: Text('Reset Quiz'),onPressed: this.resetquiz,)],) 
    );
  }
}
