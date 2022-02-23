import 'package:flutter/material.dart';

import '../model/explore_model.dart';
import '../mocks/explore_data.dart';

class ExploreViewModel extends ChangeNotifier {
  late ExploreModel explore;

  ExploreViewModel();

  Future<void> loadData(int index) async {
    explore = exploreMocks[index];
    // implement calling API if any
  }
}
