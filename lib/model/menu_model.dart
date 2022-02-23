import 'package:tvlk_test_app/assets/colors.dart';
import 'package:flutter/cupertino.dart';

class MenuModel {
  IconData icon;
  String menuName;
  Color? bgColor = colors[ColorName.primary];
  Color? iconColor;
  bool? isNew = false;

  MenuModel(
      {required this.icon, required this.menuName, this.bgColor, this.isNew, this.iconColor});
}
