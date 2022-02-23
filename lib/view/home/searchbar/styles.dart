import 'package:flutter/cupertino.dart';

import '../../../assets/colors.dart';

class SearchBarStyles {
  SearchBarStyles();

  final EdgeInsetsGeometry barItemPadding = const EdgeInsets.only(right: 8);

  final EdgeInsetsGeometry buttonItemPadding = const EdgeInsets.all(0);

  final BoxDecoration blueBackground = BoxDecoration(
    color: colors[ColorName.basicBlue],
  );

  final EdgeInsetsGeometry searchBarPadding =
      const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16);
}
