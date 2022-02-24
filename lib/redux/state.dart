import 'package:flutter/cupertino.dart';

import '../model/explore_model.dart';
import '../mocks/explore_data.dart';
import '../model/menu_model.dart';
import '../mocks/menu_data.dart';

@immutable
class TvlkTestAppState {
  final bool isLoading;
  final List<ExploreModel> explores;
  final List<List<MenuModel>> menus;

  const TvlkTestAppState({required this.isLoading, required this.explores, required this.menus});

  factory TvlkTestAppState.initial() {
    return TvlkTestAppState(isLoading: true, explores: exploreMocks, menus: [menuMocks, menuMocks, menuMocks]); // 3 of menu mocks 
  }
}
