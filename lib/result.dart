import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.finalScore, required this.resetQuiz})
      : super(key: key);
  final int finalScore;
  final Function resetQuiz;

  String get resultText {
    String result = '';
    if (finalScore <= 8) {
      result = 'You are awesome and innocent';
    } else if (finalScore <= 12) {
      result = 'Pretty likable!';
    } else {
      result = 'You are... strange?';
    }

    return 'Congrats, you did it! Your score is $finalScore. $result';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: <Widget>[
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () => resetQuiz(),
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 14),
                ))
          ],
        )));
  }
}
