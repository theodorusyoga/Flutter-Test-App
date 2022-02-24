import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:tvlk_test_app/mocks/explore_data.dart';
import 'package:tvlk_test_app/model/explore_model.dart';
import 'package:tvlk_test_app/redux/state.dart';
import 'package:tvlk_test_app/redux/reducers.dart';
import 'package:tvlk_test_app/view_model/explore.dart';

void main() {
  late Store<TvlkTestAppState> store;
  late ExploreViewModel viewModel;

  setUp(() {
    store = Store(reducer, initialState: TvlkTestAppState.initial());
    viewModel = ExploreViewModel.fromStore(store, 0); // initiate with index 0
  });

  group('view model', () {
    test('initial values are correct', () {
      ExploreModel explore = viewModel.explore;
      expect(explore, exploreMocks[0]);
    });

    test('values with index 1 are correct', () {
      viewModel = ExploreViewModel.fromStore(store, 1);
      ExploreModel explore = viewModel.explore;
      expect(explore, exploreMocks[1]);
    });

    test('values with index 2 are correct', () {
      viewModel = ExploreViewModel.fromStore(store, 2);
      ExploreModel explore = viewModel.explore;
      expect(explore, exploreMocks[2]);
    });
  });
}
