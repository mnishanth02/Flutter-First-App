import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalSCore = 0;
  void _answerQuestions(int score) {
    _totalSCore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalSCore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'Whats\'s your Favorite color',
      'answer': [
        {'text': 'Green', 'score': 3},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 2}
      ]
    },
    {
      'questionText': 'Who is your Favorite Hero',
      'answer': [
        {'text': 'Vijay', 'score': 3},
        {'text': 'Surya', 'score': 5},
        {'text': 'Vikram', 'score': 2}
      ]
    },
    {
      'questionText': 'Which is your Favorite Game Console',
      'answer': [
        {'text': 'X Box', 'score': 3},
        {'text': 'PlayStation 5', 'score': 5},
        {'text': 'Stedia', 'score': 2}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Column(
                  children: [
                    Quiz(
                      answerQuestion: _answerQuestions,
                      questionIndex: _questionIndex,
                      questions: _questions,
                    )
                  ],
                )
              : Result(_totalSCore, resetQuiz)),
    );
  }
}
