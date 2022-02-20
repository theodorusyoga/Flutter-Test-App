import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {Key? key,
      required this.questionIndex,
      required this.answerClick,
      required this.questions})
      : super(key: key);

  final int questionIndex;
  final Function answerClick;
  final List<Map<String, Object>> questions;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Question(
          questionText: questions[questionIndex]['questionText'].toString()),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map<Widget>((answer) {
        return Answer(answerClick: () => answerClick(answer['score']), answerText: answer['text'].toString());
      }).toList(),
    ];

    return Column(
      children: children,
    );
  }
}
