import 'package:flutter/cupertino.dart';

import '../../../../assets/colors.dart';

class SearchInputStyles {
  SearchInputStyles();

  // TEXT FIELD
  final BoxDecoration textFieldDecoration = BoxDecoration(
      border: Border.all(
    color: colors.containsKey(ColorName.transparent)
        ? colors[ColorName.transparent]!
        : const Color(0x00000000),
  ));

  final TextStyle searchTextStyle = TextStyle(
    backgroundColor: colors[ColorName.transparent],
  );

  final TextStyle placeholderTextStyle = TextStyle(
    color: colors[ColorName.secondary],
  );
  final EdgeInsetsGeometry placeholderContainerPadding = const EdgeInsets.only(left: 8, top: 8);

   final EdgeInsetsGeometry placeholderButtonPadding = const EdgeInsets.all(0);
  // END TEXT FIELD

  // SEARCH BOX (WHITE)
  final Border searchBoxBorder = Border.all(
    color: colors.containsKey(ColorName.transparent)
        ? colors[ColorName.transparent]!
        : const Color(0x00000000),
  );

  final BorderRadiusGeometry searchBoxBorderRadius =
      const BorderRadius.all(Radius.circular(8));

  final EdgeInsetsGeometry searchBoxPadding =
      const EdgeInsets.only(left: 8, top: 8, bottom: 8);
  // END SEARCH BOX (WHITE)

}
