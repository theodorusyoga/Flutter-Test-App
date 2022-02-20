import 'package:flutter/cupertino.dart';

import '../../../assets/colors.dart';

class MenuStyles {
  MenuStyles();

  // MENU ITEM
  BoxDecoration imageBoxDecoration(Color? bgColor) =>
      BoxDecoration(shape: BoxShape.circle, color: bgColor);

  final EdgeInsetsGeometry menuItemPadding = const EdgeInsets.only(top: 4);
  final EdgeInsetsGeometry buttonMenuItemPadding = const EdgeInsets.all(0);
  // END OF MENU ITEM

  // MENU
  final EdgeInsetsGeometry menuPadding =
      const EdgeInsets.only(top: 16, left: 8, right: 8);
  // END OF MENU
}
