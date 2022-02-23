import 'package:tvlk_test_app/view/home/searchbar/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../../assets/colors.dart';
import '../../redux/state.dart';
import '../view.dart';
import '../home/searchbar/searchbar.dart';
import '../home/explore/explore.dart';
import '../../view_model/explore.dart';

class Search extends StatelessWidget {
  const Search({Key? key, required this.store}) : super(key: key);

  final Store<TvlkTestAppState> store;

  @override
  Widget build(BuildContext context) {
    final _explores = [4, 5].map((index) => Explore(index: index)).toList();

    return MainView(
        store: store,
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            child: MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => ExploreViewModel())
                ],
                child: Column(
                  children: [
                    const SearchBar(
                      iconsDisabled: true,
                      isSearchScreen: true,
                    ),
                    ..._explores
                  ],
                )),
            backgroundColor: colors[ColorName.white]));
  }
}
