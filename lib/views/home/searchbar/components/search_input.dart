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
      required this.searchText})
      : super(key: key);

  final List<String> hintTexts;
  final String searchText;
  final Function onSearchTextChanged;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput>
    with TickerProviderStateMixin {
  late List<AnimationController> controllers;
  late List<bool> isPlaceholderShown;

  @override
  void initState() {
    super.initState();
    controllers = <AnimationController>[];
    isPlaceholderShown = <bool>[];
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
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

    var _focusNode = FocusNode();
    void focusOnSearchTextField() {
      FocusScope.of(context).requestFocus(_focusNode);
      _focusNode.requestFocus();
    }

    var _focusableSearchTextField = CupertinoTextField(
      decoration: styles.textFieldDecoration,
      onChanged: (String text) {
        widget.onSearchTextChanged(text);
        if (text == "") {
          for (var i = 0; i < controllers.length; i++) {
            setAnimation(i);
          }
        }
      },
      focusNode: _focusNode,
      style: styles.searchTextStyle,
      padding: styles.searchBoxPadding,
    );

    var _index = 0;
    List<Widget> _placeholderTexts = widget.hintTexts.map<Widget>((hintText) {
      // define animation offset
      AnimationController controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300));
      Animation<Offset> offset =
          Tween<Offset>(begin: const Offset(0.0, 1.5), end: Offset.zero)
              .animate(controller);

      isPlaceholderShown.add(false);
      controllers.add(controller);
      setAnimation(_index);
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
          onPressed: () {
            // implement focus to text field
            focusOnSearchTextField();
          },
          padding: styles.placeholderButtonPadding,
          pressedOpacity: 1,
          disabledColor: colors[ColorName.transparent]!);
    }).toList();

    var textFieldStack = Stack(
      children: [
        _focusableSearchTextField,
        // Use custom placeholder for animated placeholder
        Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: colors[Colors.transparent]),
            child: Stack(
              children: _placeholderTransitions,
            ),
            padding: styles.placeholderContainerPadding)
      ],
    );

    var textFieldContainer = Row(
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
