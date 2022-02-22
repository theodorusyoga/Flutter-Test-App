import 'package:first_app/views/home/explore/explore.dart';
import 'package:flutter/cupertino.dart';

import './searchbar/searchbar.dart';
import './menu/menu.dart';
import './points/points.dart';

import '../../mocks/explore_data.dart';
import '../../mocks/menu_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<State<StatefulWidget>> headerKey = GlobalKey();
  double _headerHeight = 0;

  // call getHeaderHeight after all widgets are loaded
  @override
  initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _getHeaderHeight());
    super.initState();
  }

  void _getHeaderHeight() {
    final BuildContext? context = headerKey.currentContext;

    setState(() {
      _headerHeight = context?.size?.height ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _headers = [SearchBar(key: headerKey)];

    final _explores = exploreMocks.map((explore) => Explore(explore: explore));

    final _contents = [Points(), Menu(menus: [menuMocks, menuMocks, menuMocks]), ..._explores];

    final double _screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom;
    final double _contentsHeight = _screenHeight -
        _headerHeight -
        56; // 56 is CupertinoTabBar's default height + padding

    return Column(children: [
      Column(
        children: _headers,
      ),
      SizedBox(
        child: ListView(
          shrinkWrap: true,
          children: _contents,
        ),
        height: _contentsHeight,
      )
    ]);
  }
}
