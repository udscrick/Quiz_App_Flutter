import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestions;
  final Function resetQuiz;
  Quiz({this.questions,this.questionIndex,this.answerQuestions,this.resetQuiz});
  //questions[_questionIndex]['questionText']
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Question(questions[questionIndex]['questionText']),
            // RaisedButton(
            //   child: Text("Answer1"),
            //   onPressed: _answerQuestions,//We pass the pointer of the function and not the result of the function as the return type of the function is void and thus cannot be stored
            // ),
            ...(questions[questionIndex]['answers'] as List<Map<String,Object>>)
                .map((e) => Answer(()=>answerQuestions(e['score']), e['text']))
                .toList(),
              RaisedButton(child: Text('Reset Quiz'),onPressed: resetQuiz,)
            //  Answer(_answerQuestions,questions[_questionIndex]['answers']),
            //  Answer(_answerQuestions,questions[_questionIndex]['answers']),
            //  Answer(_answerQuestions,questions[_questionIndex]['answers'])
          ],
        );
  }
}