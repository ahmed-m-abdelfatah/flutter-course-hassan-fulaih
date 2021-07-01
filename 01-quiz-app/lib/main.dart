import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

Color w = Colors.white;
Color b = Colors.black;

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  int _questionIndex = 0;
  int _totalScore = 0;
  List num = [];

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'Ahmed', 'score': 10},
        {'text': 'Ahmed', 'score': 20},
        {'text': 'Ahmed', 'score': 30},
      ]
    },
  ];

  void answerQuestion(int score) {
    num.add(score);
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    // print("### Answer Chosen !");
    // print("_questionIndex = $_questionIndex");
    // print("num = $num");
    // print("num[_questionIndex] = ${num[_questionIndex - 1]}");
    // print("_totalScore = $_totalScore");
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(color: w),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                  if (isSwitched == true) {
                    w = Colors.black;
                    b = Colors.white;
                  }
                  if (isSwitched == false) {
                    w = Colors.white;
                    b = Colors.black;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            )
          ],
        ),
        body: Container(
          color: w,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: w,
            size: 40,
          ),
          onPressed: () {
            if (_questionIndex > 0) {
              _totalScore -= num[_questionIndex - 1];
              num.removeLast();
            }

            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });

            // print("### Back !");
            // print("_questionIndex = $_questionIndex");
            // print("num = $num");
            // print("_totalScore = $_totalScore");
          },
        ),
      ),
    );
  }
}
