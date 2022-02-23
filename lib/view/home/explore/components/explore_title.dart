import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/colors.dart';
import './styles.dart';

class ExploreTitle extends StatelessWidget {
  ExploreTitle(
      {Key? key,
      required this.title,
      required this.description,
      required this.onPressed})
      : super(key: key);

  final String title;
  final String description;
  final Function onPressed;

  final _styles = ExploreItemStyles();

  @override
  Widget build(BuildContext context) {
    final _text = Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: _styles.titleTextStyle, textAlign: TextAlign.left),
            description != ''
                ? Text(description,
                    style: _styles.descriptionTextStyle,
                    textAlign: TextAlign.left)
                : Container()
          ],
        ),
        alignment: Alignment.topLeft,
      ),
    );

    return CupertinoButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _text,
          Center(
              child: Icon(
            Icons.chevron_right,
            size: 32,
            color: colors[ColorName.basicBlue],
          ))
        ],
      ),
      onPressed: () => onPressed(),
      minSize: 0,
      padding: _styles.buttonPadding,
    );
  }
}
