import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

import '../../assets/colors.dart';
import '../../redux/state.dart';
import '../view.dart';

class Search extends StatelessWidget {
  const Search({Key? key, required this.store}) : super(key: key);

  final Store<TvlkTestAppState> store;

  @override
  Widget build(BuildContext context) {
    return MainView(
        store: store,
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            child: Container(),
            backgroundColor: colors[ColorName.white]));
  }
}
