import 'package:flutter/cupertino.dart';

import './searchbar/searchbar.dart';
import './menu/menu.dart';
import './points/points.dart';
import './explore/explore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeItems = [const SearchBar(), Points(), Menu(), Explore()];

    return Column(
      children: homeItems,
    );
  }
}
