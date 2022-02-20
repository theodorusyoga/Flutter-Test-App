import 'package:flutter/cupertino.dart';

import './searchbar/searchbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeItems = [const SearchBar()];

    return Column(
      children: homeItems,
    );
  }
}
