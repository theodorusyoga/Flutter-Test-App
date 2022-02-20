import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerClick;
  final String answerText;

  // ignore: use_key_in_widget_constructors
  const Answer({required this.answerClick, required this.answerText}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: Text(
            answerText,
            style: const TextStyle(fontSize: 24),
          ),
          onPressed: () {
            answerClick();
          },
        ));
  }
}
