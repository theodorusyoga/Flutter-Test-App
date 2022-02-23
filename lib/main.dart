import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './view/home/home.dart';
import './assets/colors.dart';
import './redux/reducers.dart';
import './redux/state.dart';

void main() => runApp(const TvlkTestApp());

class TvlkTestApp extends StatefulWidget {
  const TvlkTestApp({Key? key}) : super(key: key);

  @override
  State<TvlkTestApp> createState() => _TvlkTestAppState();
}

class _TvlkTestAppState extends State<TvlkTestApp> {
  final store = Store(reducer,
      initialState: TvlkTestAppState.initial(), middleware: [thunkMiddleware]);

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
      home: 
      StoreProvider(
          store: store,
          child: Container(
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
          )),
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
