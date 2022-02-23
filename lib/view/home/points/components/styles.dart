import 'package:flutter/cupertino.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/fonts.dart';

class PointStyles {
  PointStyles();

  // POINT ITEM
  final EdgeInsetsGeometry pointItemPadding = const EdgeInsets.all(4);

  final EdgeInsetsGeometry pointItemIconPadding =
      const EdgeInsets.only(right: 4);

  final TextStyle pointItemText = regularTextStyle.merge(TextStyle(
    color: colors[ColorName.white],
  ));

  final TextStyle pointItemTitleText = regularTextStyleBold.merge(TextStyle(
    color: colors[ColorName.white],
  ));
  // END OF POINT ITEM

  // BUTTON
  final EdgeInsetsGeometry buttonPadding =
      const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2);
  final TextStyle buttonText = regularTextStyle.merge(TextStyle(
    fontSize: 10,
    color: colors[ColorName.basicBlue],
  ));
  final BorderRadius buttonBorderRadius =
      const BorderRadius.all(Radius.circular(16));
  //END OF BUTTON

}
