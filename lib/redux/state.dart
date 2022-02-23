import 'package:flutter/cupertino.dart';

import '../model/explore_model.dart';
import '../mocks/explore_data.dart';

@immutable
class TvlkTestAppState {
  final bool isLoading;
  final List<ExploreModel> explores;

  const TvlkTestAppState({required this.isLoading, required this.explores});

  factory TvlkTestAppState.initial() {
    return TvlkTestAppState(isLoading: true, explores: exploreMocks);
  }
}
