import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../model/explore_model.dart';
import '../mocks/explore_data.dart';
import '../redux/state.dart';

class ExploreViewModel extends ChangeNotifier {
  final ExploreModel explore;

  ExploreViewModel({required this.explore});

  static ExploreViewModel fromStore(Store<TvlkTestAppState> store, int index) {
    return ExploreViewModel(explore: exploreMocks[index]);
  }
}
