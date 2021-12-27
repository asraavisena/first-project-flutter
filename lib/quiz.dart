import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Question(questions[questionIndex]['questionText'] as String),
        // SEND ANSWERQUESTION FUNCTION WITHOUT PARENTHESES
        // IT IS LIKE CALLBACK IN  JAVASCRIPT
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // Added function that has parameter
          return Answer(() => answerQuestion(answer['score'] as int),
              answer['text'] as String);
        }).toList()
      ],
    );
  }
}
