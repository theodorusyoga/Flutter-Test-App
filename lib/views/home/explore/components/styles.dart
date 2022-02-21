import 'package:flutter/cupertino.dart';

import '../../../../assets/colors.dart';
import '../../../../assets/fonts.dart';

class ExploreItemStyles {
  ExploreItemStyles();

  // TOOLTIP AND BOOKMARK ICON
  final BorderRadius tooltipBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(8), bottomRight: Radius.circular(8));

  final TextStyle locationTextStyle = regularTextStyleBold.merge(TextStyle(
    color: colors[ColorName.white],
  ));

  final EdgeInsetsGeometry tooltipPadding =
      const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4);

  final EdgeInsetsGeometry bookmarkIconPadding = const EdgeInsets.all(8);

  // END OF TOOLTIP AND BOOKMARK ICON

  // IMAGE
  final BoxDecoration imageContainerDecoration =
      const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)));

  final EdgeInsetsGeometry containerPadding = const EdgeInsets.only(top: 0, left: 16, right: 0, bottom: 0);
  // END OF IMAGE
}
