import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function resetQuizHandler;

  Result(this.result, this.resetQuizHandler);

  String get resultPhrase {
    String resultText;
    if (result <= 6) {
      resultText = 'You are Awsome and Innocent';
    } else if (result <= 10) {
      resultText = 'Pretty Likable';
    } else if (result <= 15) {
      resultText = 'You are strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: resetQuizHandler,
              child: Text('Restart Quiz!'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
