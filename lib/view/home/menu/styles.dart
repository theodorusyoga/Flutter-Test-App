import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../assets/fonts.dart';
import '../../../assets/colors.dart';

class MenuStyles {
  MenuStyles();

  // MENU ITEM
  BoxDecoration imageBoxDecoration(Color? bgColor) =>
      BoxDecoration(shape: BoxShape.circle, color: bgColor);

  final EdgeInsetsGeometry menuItemPadding = const EdgeInsets.only(top: 4);
  final EdgeInsetsGeometry buttonMenuItemPadding = const EdgeInsets.all(0);
  final TextStyle menuItemTextStyle =
      regularTextStyle.merge(const TextStyle(fontSize: 10));
  // END OF MENU ITEM

  // MENU
  final EdgeInsetsGeometry menuPadding =
      const EdgeInsets.only(top: 16, left: 8, right: 8);
  // END OF MENU

  // CAROUSEL SLIDER
  CarouselOptions carouselOptions(Function onPageChanged) => CarouselOptions(
      enableInfiniteScroll: false,
      viewportFraction: 1.0,
      enlargeCenterPage: false,
      height: 275,
      onPageChanged: (index, reason) => onPageChanged(index, reason));

  final EdgeInsetsGeometry indicatorMargin =
      const EdgeInsets.symmetric(vertical: 8, horizontal: 4);

  Color indicatorColor(
          BuildContext context, int selectedIndex, int currentKey) =>
      ((Theme.of(context).brightness == Brightness.dark
              ? colors[ColorName.white]!
              : colors[ColorName.primary]!))
          .withOpacity(selectedIndex == currentKey ? 0.9 : 0.4);
  // END OF CAROUSEL SLIDER
}
