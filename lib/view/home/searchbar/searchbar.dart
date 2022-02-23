import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../assets/colors.dart';
import './components/search_input.dart';
import './styles.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, this.iconsDisabled, this.isSearchScreen})
      : super(key: key);

  final bool? iconsDisabled;
  final bool? isSearchScreen;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final styles = SearchBarStyles();
  var _searchText = '';

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _searchBarItems = [
      Expanded(
          flex: 10,
          child: Container(
            child: SearchInput(
              isSearchScreen: widget.isSearchScreen,
              hintTexts: const [
                'Search for items or places...',
                'Search for movies...',
                'Search for anything...'
              ],
              onSearchTextChanged: _onSearchTextChanged,
              searchText: _searchText,
            ),
            padding: styles.barItemPadding,
          )),
      widget.iconsDisabled == true
          ? Container()
          : Flexible(
              child: Container(
                  child: CupertinoButton(
                    child: Icon(Icons.notifications,
                        size: 28, color: colors[ColorName.white]),
                    onPressed: () {
                      // implement notification press
                    },
                    padding: styles.buttonItemPadding,
                  ),
                  padding: styles.barItemPadding)),
      widget.iconsDisabled == true
          ? Container()
          : Flexible(
              child: Container(
                  child: CupertinoButton(
                      child: Icon(Icons.messenger_outline,
                          size: 28, color: colors[ColorName.white]),
                      onPressed: () {
                        // implement message press
                      },
                      padding: styles.buttonItemPadding),
                  padding: styles.barItemPadding)),
      widget.iconsDisabled == true
          ? Flexible(
            flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                width: 200,
                  child: CupertinoButton(
                    child: 
                    Text('Cancel', style: styles.cancelTextStyle,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: styles.buttonItemPadding,
                  ),
                  padding: styles.barItemPadding))
          : Container(),
    ];

    return Container(
      decoration: styles.blueBackground,
      padding: styles.searchBarPadding,
      child: Row(children: _searchBarItems),
    );
  }
}
