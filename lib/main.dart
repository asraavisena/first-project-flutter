import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // lists
    // var questions = [
    //   'What\s is your favourite colour?',
    //   'What\s is your favourite animal?'
    // ];
    // create map for questions
    // a list can have a const so the list can not be changed
    const questions = [
      {
        'questionText': 'What\'s is your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'Blue']
      },
      {
        'questionText': 'What\'s is your favourite animal?',
        'answers': ['Cat', 'Rabbit', 'Cow', 'Goat']
      },
      {
        'questionText': 'What\'s is My Name',
        'answers': ['Asra', 'Avisena', 'Asra Avisena', 'Ovi']
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Question(questions[questionIndex]['questionText'].toString()),
            // SEND ANSWERQUESTION FUNCTION WITHOUT PARENTHESES
            // IT IS LIKE CALLBACK IN  JAVASCRIPT
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
