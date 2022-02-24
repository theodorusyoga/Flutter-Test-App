import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../model/menu_model.dart';
import '../redux/state.dart';

class MenuViewModel extends ChangeNotifier {
  final List<List<MenuModel>> menus;

  MenuViewModel({required this.menus});

  static MenuViewModel fromStore(Store<TvlkTestAppState> store) {
    return MenuViewModel(menus: store.state.menus);
  }
}
