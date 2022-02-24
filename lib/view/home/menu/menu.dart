import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../model/menu_model.dart';
import './menuitem.dart';
import './styles.dart';
import '../../../redux/state.dart';
import '../../../view_model/menu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

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

    List<Widget> _getGestureIndicator(List<List<MenuModel>> menus) => menus
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

    List<Widget> _getMenus(List<List<MenuModel>> menus) => menus
        .map<Widget>((menu) => Container(
              child: Wrap(
                children: _renderMenuItem(menu),
                runSpacing: 16,
              ),
              padding: _styles.menuPadding,
            ))
        .toList();

    return StoreConnector<TvlkTestAppState, MenuViewModel>(
        builder: (_, viewModel) => Column(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: _getMenus(viewModel.menus),
                  options: _styles.carouselOptions(_onCarouselPageChanged),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getGestureIndicator(viewModel.menus),
                )
              ],
            ),
            converter: (store) => MenuViewModel.fromStore(store));
  }
}
