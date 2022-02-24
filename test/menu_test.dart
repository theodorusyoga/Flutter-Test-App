import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:tvlk_test_app/mocks/menu_data.dart';
import 'package:tvlk_test_app/model/menu_model.dart';
import 'package:tvlk_test_app/redux/state.dart';
import 'package:tvlk_test_app/redux/reducers.dart';
import 'package:tvlk_test_app/view_model/menu.dart';

void main() {
  late Store<TvlkTestAppState> store;
  late MenuViewModel viewModel;

  setUp(() {
    store = Store(reducer, initialState: TvlkTestAppState.initial());
    viewModel = MenuViewModel.fromStore(store); // initiate with index 0
  });

  test('initial values are correct', () {
    List<List<MenuModel>> menus = viewModel.menus;
    expect(menus,[menuMocks, menuMocks, menuMocks]);
  });
}
