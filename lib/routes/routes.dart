import 'package:flutter/material.dart';

import '../view/home/home.dart';
import '../view/search/search.dart';

Map<String, Widget Function(BuildContext context)> routes(store) {
  return {
    '/': (context) => Home(
          store: store,
        ),
    '/search': (context) => Search(store: store)
  };
}
