import 'package:flutter/cupertino.dart';

import '../../../../assets/colors.dart';

class PointsStyles {
  PointsStyles();

  final EdgeInsetsGeometry containerMargin =
      const EdgeInsets.only(left: 16, right: 16, top: 8);

  final EdgeInsetsGeometry containerPadding =
      const EdgeInsets.only(top: 4, bottom: 4);

  final BoxDecoration containerDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      color: colors[ColorName.basicBlue]);
}
