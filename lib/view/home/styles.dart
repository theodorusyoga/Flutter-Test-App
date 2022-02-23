import 'package:flutter/cupertino.dart';

import '../../../assets/colors.dart';
import '../../../assets/fonts.dart';

class HomeStyles {
  HomeStyles();

  final EdgeInsetsGeometry headerPadding =
      const EdgeInsets.only(left: 16, right: 16, top: 0);

  final TextStyle headerTextStyle =
      mediumTextStyleBold.merge(TextStyle(color: colors[ColorName.white]));

  final BoxDecoration headerDecoration = BoxDecoration(
      color: colors[ColorName.white],
      border: Border(
          bottom: BorderSide(color: colors[ColorName.secondary]!, width: 2)));

  final BoxDecoration headerTextDecoration = BoxDecoration(
      color: colors[ColorName.basicBlue],
      borderRadius: const BorderRadius.all(Radius.circular(8)));

  final EdgeInsetsGeometry headerTextPadding =
      const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3);
}
