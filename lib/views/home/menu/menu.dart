import 'package:flutter/material.dart';

import '../../../model/menu_model.dart';
import '../../../assets/colors.dart';
import './menuitem.dart';
import './styles.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

var menuItems = <MenuModel>[
  MenuModel(
      icon: Icons.flight,
      menuName: "Flights",
      bgColor: colors[ColorName.flightBlue]),
  MenuModel(
      icon: Icons.maps_home_work,
      menuName: "Hotels",
      bgColor: colors[ColorName.hotelDarkBlue]),
  MenuModel(
      icon: Icons.check,
      menuName: "Xperience",
      bgColor: colors[ColorName.xperiencePink]),
  MenuModel(
      icon: Icons.fastfood,
      menuName: "Eats",
      bgColor: colors[ColorName.orangeEats]),
  MenuModel(
      icon: Icons.attach_money,
      menuName: "Financial",
      bgColor: colors[ColorName.financialDarkBlue]),
  // DUPLICATED FOR SECOND ROW
  MenuModel(
      icon: Icons.flight,
      menuName: "Flights",
      bgColor: colors[ColorName.flightBlue]),
  MenuModel(
      icon: Icons.maps_home_work,
      menuName: "Hotels",
      bgColor: colors[ColorName.hotelDarkBlue]),
  MenuModel(
      icon: Icons.check,
      menuName: "Xperience",
      bgColor: colors[ColorName.xperiencePink]),
  MenuModel(
      icon: Icons.fastfood,
      menuName: "Eats",
      bgColor: colors[ColorName.orangeEats]),
  MenuModel(
      icon: Icons.attach_money,
      menuName: "Financial",
      bgColor: colors[ColorName.financialDarkBlue]),
  // DUPLICATED FOR THIRD ROW
  MenuModel(
      icon: Icons.flight,
      menuName: "Flights",
      bgColor: colors[ColorName.flightBlue]),
  MenuModel(
      icon: Icons.maps_home_work,
      menuName: "Hotels",
      bgColor: colors[ColorName.hotelDarkBlue]),
  MenuModel(
      icon: Icons.check,
      menuName: "Xperience",
      bgColor: colors[ColorName.xperiencePink]),
  MenuModel(
      icon: Icons.fastfood,
      menuName: "Eats",
      bgColor: colors[ColorName.orangeEats]),
  MenuModel(
      icon: Icons.attach_money,
      menuName: "Financial",
      bgColor: colors[ColorName.financialDarkBlue])
];

class _MenuState extends State<Menu> {
  void _onMenuItemPressed() {
    // implement menu item pressed
  }

  final _styles = MenuStyles();

  @override
  Widget build(BuildContext context) {
    final List<Widget> flexibleMenuItem = menuItems
        .map<Widget>((menuItem) => MenuItem(
              menuModel: menuItem,
              menuItemSize: MenuItemSize.medium,
              onMenuItemPressed: () => _onMenuItemPressed(),
            ))
        .toList();

    return Container(
      child: Wrap(
        children: flexibleMenuItem,
        runSpacing: 16,
      ),
      padding: _styles.menuPadding,
    );
  }
}
