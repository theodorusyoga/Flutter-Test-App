import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../model/menu_model.dart';
import '../../../assets/colors.dart';
import './menuitem.dart';
import './styles.dart';

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

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final CarouselController _controller = CarouselController();

  int _currentCarouselIndex = 0;

  void _onMenuItemPressed() {
    // implement menu item pressed
  }

  final _styles = MenuStyles();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _flexibleMenuItem1 = menuItems
        .map<Widget>((menuItem) => MenuItem(
              menuModel: menuItem,
              menuItemSize: MenuItemSize.medium,
              onMenuItemPressed: () => _onMenuItemPressed(),
            ))
        .toList();

    final List<Widget> _flexibleMenuItem2 = menuItems
        .map<Widget>((menuItem) => MenuItem(
              menuModel: menuItem,
              menuItemSize: MenuItemSize.medium,
              onMenuItemPressed: () => _onMenuItemPressed(),
            ))
        .toList();

    void _onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
      setState(() {
        _currentCarouselIndex = index;
      });
    }

    List<Widget> _gestureIndicator = [1, 2]
        .asMap()
        .entries
        .map((entry) => GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8,
              height: 8,
              margin: _styles.indicatorMargin,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _styles.indicatorColor(
                    context, _currentCarouselIndex, entry.key),
              ),
            )))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: [
            Container(
              child: Wrap(
                children: _flexibleMenuItem1,
                runSpacing: 16,
              ),
              padding: _styles.menuPadding,
            ),
            Container(
              child: Wrap(
                children: _flexibleMenuItem2,
                runSpacing: 16,
              ),
              padding: _styles.menuPadding,
            )
          ],
          options: _styles.carouselOptions(_onCarouselPageChanged),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _gestureIndicator,
        )
      ],
    );
  }
}
