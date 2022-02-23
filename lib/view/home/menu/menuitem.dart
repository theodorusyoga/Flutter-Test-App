import 'package:flutter/cupertino.dart';

import '../../../assets/colors.dart';
import '../../../model/menu_model.dart';
import './styles.dart';

enum MenuItemSize { small, medium, large }
const numberOfItems = 5;

class MenuItem extends StatelessWidget {
  MenuItem({Key? key, required this.menuModel, required this.menuItemSize, required this.onMenuItemPressed})
      : super(key: key);

  final MenuModel menuModel;
  final MenuItemSize menuItemSize;
  final void Function() onMenuItemPressed;
  final _styles = MenuStyles();

  double get iconSize {
    switch (menuItemSize) {
      case MenuItemSize.small:
        return 42;
      case MenuItemSize.medium:
        return 46;
      case MenuItemSize.large:
        return 50;
      default:
        return 46;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _widthWithoutPadding = _width - 32;
    final double _itemWidth = _widthWithoutPadding / numberOfItems;

    final _iconImage = Container(
      child: Center(
          child:
              Icon(menuModel.icon, size: 26, color: menuModel.iconColor ?? colors[ColorName.white])),
      width: iconSize,
      height: iconSize,
      decoration: _styles.imageBoxDecoration(menuModel.bgColor),
    );

    return Container(
      child: CupertinoButton(
          child: Column(
            children: [
              _iconImage,
              const SizedBox(height: 4),
              Text(menuModel.menuName, style: _styles.menuItemTextStyle, textAlign: TextAlign.center,)
            ],
          ),
          onPressed: () => onMenuItemPressed(),
          padding: _styles.buttonMenuItemPadding),
      width: _itemWidth,
      padding: _styles.menuItemPadding,
    );
  }
}
