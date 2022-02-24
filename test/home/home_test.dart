import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:tvlk_test_app/redux/state.dart';
import 'package:tvlk_test_app/redux/reducers.dart';

import 'package:tvlk_test_app/view_model/home.dart';

void main() {
  late Store<TvlkTestAppState> store;
  late HomeViewModel viewModel;

  setUp(() {
    store = Store(reducer, initialState: TvlkTestAppState.initial());
    viewModel = HomeViewModel.fromStore(store);
  });

  group('view model', () {
    test('initial values are correct', () {
      bool isLoading = viewModel.isLoading;
      expect(isLoading, true);
    });

    test('dispatched values are correct', () {
      viewModel.setIsLoading(false);
      viewModel = HomeViewModel.fromStore(store);
      expect(viewModel.isLoading, false);
    });
  });

}
