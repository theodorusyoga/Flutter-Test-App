import 'package:first_app/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import './quiz.dart';
import './views/home/home.dart';
import './assets/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 7}
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 8},
        {'text': 'Dog', 'score': 6},
        {'text': 'Rabbit', 'score': 9}
      ]
    },
    {
      'questionText': 'What is your favorite instructor?',
      'answers': [
        {'text': 'Robert', 'score': 10},
        {'text': 'Max', 'score': 1},
        {'text': 'Alice', 'score': 5}
      ]
    }
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    Home activeScreen(int index) {
      switch (index) {
        case 1:
          return const Home();
        default:
          return const Home();
      }
    }

    return CupertinoApp(
      home: Container(
        child: SafeArea(
            child: CupertinoPageScaffold(
              resizeToAvoidBottomInset: false,
                child: CupertinoTabScaffold(
                    tabBar: CupertinoTabBar(items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.profile_circled),
                          label: 'Profile'),
                    ]),
                    tabBuilder: (BuildContext context, int index) {
                      return CupertinoTabView(
                        builder: (BuildContext context) {
                          return Center(
                            child: activeScreen(index),
                          );
                        },
                      );
                    }),
                backgroundColor: colors[ColorName.white]),
            bottom: false),
        color: colors[ColorName.basicBlue],
      ),
      theme: const CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(fontFamily: 'OpenSans'))),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('My First App'),
    //     ),
    //     body: _questionIndex < _questions.length
    //         ? Quiz(
    //             answerClick: _answerQuestion,
    //             questionIndex: _questionIndex,
    //             questions: _questions)
    //         : Result(finalScore: _totalScore, resetQuiz: _resetQuiz),
    //   ),
    // );
  }
}
