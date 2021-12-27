import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback answerQuestion;
  Result(this.resultScore, this.answerQuestion);
  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore >= 16) {
      resultText = 'You are awesome and Fantastic';
    } else if (resultScore >= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore >= 8) {
      resultText = 'You are strangers!!!';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      FlatButton(
        onPressed: answerQuestion,
        child: Text('Restart Quiz'),
        textColor: Colors.blue,
      )
    ]);
  }
}
