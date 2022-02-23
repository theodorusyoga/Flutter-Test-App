import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './redux/reducers.dart';
import './redux/state.dart';
import './routes/routes.dart';

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


    return CupertinoApp(
      routes: routes(store),
      theme: const CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(fontFamily: 'OpenSans'))),
    );
  }
}
