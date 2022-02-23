import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/colors.dart';
import './styles.dart';

class SearchInput extends StatefulWidget {
  const SearchInput(
      {Key? key,
      required this.hintTexts,
      required this.onSearchTextChanged,
      required this.searchText,
      this.isSearchScreen})
      : super(key: key);

  final List<String> hintTexts;
  final String searchText;
  final void Function(String text) onSearchTextChanged;
  final bool? isSearchScreen;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput>
    with TickerProviderStateMixin {
  late List<AnimationController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = <AnimationController>[];

    for (int i = 0; i < widget.hintTexts.length; i++) {
      controllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300)));
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      runAnimation();
    });
  }

  @override
  void dispose() {
    for (AnimationController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void runAnimation() {
    for (int i = 0; i < widget.hintTexts.length; i++) {
      setAnimation(i);
    }
  }

  void setAnimation(int index) {
    // For appearing placeholder
    Future.delayed(Duration(seconds: index == 0 ? 1 : 3 * (index + 1)), () {
      controllers[index].forward();

      if (index < widget.hintTexts.length - 1) {
        Future.delayed(
            Duration(
                seconds: index == 0 ? 4 : 3,
                milliseconds: index == 0 ? 750 : 0), () {
          controllers[index].reverse();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = SearchInputStyles();

    FocusNode _focusNode = FocusNode();
    void _onNavigateToSearch() {
      Navigator.of(context, rootNavigator: true).pushNamed('/search');
    }

    void _focusOnSearchTextField() {
      FocusScope.of(context).requestFocus(_focusNode);
      _focusNode.requestFocus();
    }

    Widget _focusableSearchTextField = CupertinoTextField(
      autofocus: true,
      enabled: widget.isSearchScreen == true,
      decoration: styles.textFieldDecoration,
      onChanged: (String text) {
        widget.onSearchTextChanged(text);
        for (AnimationController controller in controllers) {
          controller.reverse();
        }
      },
      onTap: widget.isSearchScreen == true
          ? _focusOnSearchTextField
          : _onNavigateToSearch,
      focusNode: _focusNode,
      style: styles.searchTextStyle,
      padding: styles.searchBoxPadding,
    );

    int _index = 0;
    List<Widget> _placeholderTexts = widget.hintTexts.map<Widget>((hintText) {
      // define animation offset
      Animation<Offset> offset =
          Tween<Offset>(begin: const Offset(0.0, 1.5), end: Offset.zero)
              .animate(controllers[_index]);

      _index++;

      return SlideTransition(
          position: offset,
          child: Text(
            hintText,
            style: styles.placeholderTextStyle,
          ));
    }).toList();

    List<Widget> _placeholderTransitions =
        _placeholderTexts.map<Widget>((placeholderText) {
      return CupertinoButton(
          minSize: 0,
          child: placeholderText,
          onPressed: widget.isSearchScreen == true
              ? _focusOnSearchTextField
              : _onNavigateToSearch,
          padding: styles.placeholderButtonPadding,
          pressedOpacity: 1,
          disabledColor: colors[ColorName.transparent]!);
    }).toList();

    Widget textFieldStack = Stack(
      children: [
        _focusableSearchTextField,
        // Use custom placeholder for animated placeholder
        Opacity(
            opacity: widget.searchText != "" ? 0 : 1,
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(color: colors[Colors.transparent]),
                child: Stack(
                  children: _placeholderTransitions,
                ),
                padding: styles.placeholderContainerPadding))
      ],
    );

    Widget textFieldContainer = Row(
      children: [
        Flexible(
            child: Container(
          child: Icon(Icons.search, size: 24, color: colors[ColorName.primary]),
          padding: styles.searchBoxPadding,
        )),
        Expanded(flex: 10, child: textFieldStack)
      ],
    );

    return Container(
        child: textFieldContainer,
        decoration: BoxDecoration(
          border: styles.searchBoxBorder,
          color: colors[ColorName.white],
          borderRadius: styles.searchBoxBorderRadius,
        ));
  }
}
