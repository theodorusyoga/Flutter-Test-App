import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:tvlk_test_app/redux/actions.dart';
import 'package:tvlk_test_app/redux/state.dart';
import 'package:tvlk_test_app/redux/reducers.dart';
import 'package:tvlk_test_app/mocks/explore_data.dart';
import '../mocks/reducer_mocks.dart';

void main() {
  late Store<TvlkTestAppState> store;

  setUp(() {
    store = Store(reducer, initialState: TvlkTestAppState.initial());
  });

  test('initial values are correct', () {
    expect(store.state.isLoading, true);
    expect(store.state.explores.length, exploreMocks.length);
    expect(store.state.menus.length,
        3); // 3 is defined manually in lib/redux/state.dart
  });

  test('changed values are correct', () {
    store = Store(reducer,
        initialState: TvlkTestAppState(
            isLoading: false, explores: mockExploreModels, menus: mockMenus));
    expect(store.state.isLoading, false);
    expect(store.state.explores.length, mockExploreModels.length);
    expect(store.state.menus.length, mockMenus.length);
  });

  test('isLoading value is changed as expected', () async {
    await store.dispatch(SetGlobalLoadingAction(false));
    expect(store.state.isLoading, false);
    await store.dispatch(SetGlobalLoadingAction(true));
    expect(store.state.isLoading, true);
  });
}
