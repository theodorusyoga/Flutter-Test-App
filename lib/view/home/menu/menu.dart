import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../model/menu_model.dart';
import './menuitem.dart';
import './styles.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.menus}) : super(key: key);

  final List<List<MenuModel>> menus;

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
    List<Widget> _renderMenuItem(List<MenuModel> menuItems) => menuItems
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

    List<Widget> _gestureIndicator = widget.menus
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

    List<Widget> _menus = widget.menus
        .map<Widget>((menu) => Container(
              child: Wrap(
                children: _renderMenuItem(menu),
                runSpacing: 16,
              ),
              padding: _styles.menuPadding,
            ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: _menus,
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
