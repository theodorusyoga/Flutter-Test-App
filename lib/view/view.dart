import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/state.dart';
import '../assets/colors.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key, required this.store, required this.child}) : super(key: key);

  final Store<TvlkTestAppState> store;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: Container(
          child: SafeArea(child: child, bottom: false),
          color: colors[ColorName.basicBlue],
        ));
  }
}
