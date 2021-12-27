import 'package:first_flutter_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'New Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // createState() -> for statefullWidget
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var questionIndex = 0;
  var _totalScore = 0;
  // ! OR CHANGE INTO FINAL
  static const _questions = [
    {
      'questionText': 'What\'s is your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 4},
        {'text': 'Green', 'score': 9},
        {'text': 'Blue', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s is your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 7},
        {'text': 'Rabbit', 'score': 9},
        {'text': 'Cow', 'score': 5},
        {'text': 'Goat', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s is My Name',
      'answers': [
        {'text': 'Asra', 'score': 10},
        {'text': 'Avisena', 'score': 3},
        {'text': 'Asra Avisena', 'score': 6},
        {'text': 'Ovi', 'score': 8}
      ]
    },
  ];
  int _counter = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    if (questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('We have no more question');
    }
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // lists
    // var _questions = [
    //   'What\s is your favourite colour?',
    //   'What\s is your favourite animal?'
    // ];
    // create map for _questions
    // a list can have a const so the list can not be changed

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
