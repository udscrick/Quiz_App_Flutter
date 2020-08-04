import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //Connecting the state of the stateful widget with the widget itself
  }
}

class _MyAppState extends State<MyApp> {
  //State is a generic class that needs to be used in case of using Stateful WIdgets
  //Q]Why do we need two classes in case of Stateful Widgets?
  //A: Because, the 'MyAPp' class will be rerendered each time internal or external data changes, but the _MyAppState class is not rerendered

  var _questionIndex = 0;
  var totalScore = 0;
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 50},
        {'text': 'Green', 'score': 30},
        {'text': 'Blue', 'score': 20},
        {'text': 'Orange', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 50},
        {'text': 'Cat', 'score': 30},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Horse', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite food?',
      'answers': [
        {'text': 'Pizza', 'score': 50},
        {'text': 'Noodles', 'score': 30},
        {'text': 'Curry', 'score': 20},
        {'text': 'French Fries', 'score': 10}
      ]
    },
    // 'What\'s your favourite animal?',
  ];

  void _answerQuestions(int score) {
    totalScore += score;
    print(totalScore);
    setState(() {
      if (_questionIndex < questions.length) {
        _questionIndex =
            _questionIndex + 1; //Correct method to update the state of a widget
      }
    });
    // _questionIndex = _questionIndex+1;//This is an incorrect method to update the state of a widget
    // print("Answer is chosen!");
    print(_questionIndex);
  }

  void resetQuiz(){
    setState(() {
      totalScore = 0;
    _questionIndex = 0;  
    });
    
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to My App"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestions: _answerQuestions,
                resetQuiz:resetQuiz)
            : Result(totalScore,resetQuiz)
      ),
    );
  }
}


///WE can refactor any widget stateful to stateless or wrap in column etc, using the shortcut to refactor with ctrl+shift+r