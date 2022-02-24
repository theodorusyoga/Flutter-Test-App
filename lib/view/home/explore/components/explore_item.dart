import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../model/explore_item_model.dart';
import '../../../../assets/colors.dart';
import '../../../../assets/fonts.dart';

import './styles.dart';

double imageSize = 200;

class ExploreItem extends StatelessWidget {
  ExploreItem(
      {Key? key,
      required this.exploreItem,
      required this.onBookmarkPressed,
      required this.onPressed,
      required this.isLastItem})
      : super(key: key);

  final ExploreItemModel exploreItem;
  final void Function(String id) onPressed;
  final void Function(String id) onBookmarkPressed;
  final bool isLastItem;

  final _styles = ExploreItemStyles();

  @override
  Widget build(BuildContext context) {
    final _imageTop = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(exploreItem.location,
              key: const Key("itemLocation"), style: _styles.locationTextStyle),
          decoration: BoxDecoration(
              color: colors[ColorName.orangeTooltip],
              borderRadius: _styles.tooltipBorderRadius),
          padding: _styles.tooltipPadding,
        ),
        CupertinoButton(
          key: const Key("itemBookmarkButton"),
          child: Icon(Icons.bookmark, size: 32, color: colors[ColorName.white]),
          onPressed: () => onBookmarkPressed(exploreItem.id),
          minSize: 0,
          padding: _styles.bookmarkIconPadding,
        )
      ],
    );

    final _image = Container(
      child: Stack(
        children: [
          Image.asset(
            exploreItem.imagePath,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
          _imageTop,
        ],
      ),
      clipBehavior: Clip.hardEdge,
      decoration: _styles.imageContainerDecoration,
    );

    return CupertinoButton(
        key: const Key("itemButton"),
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image,
              const SizedBox(height: 8),
              Text(exploreItem.name,
                  key: const Key("itemName"),
                  maxLines: 2,
                  style: normalTextStyleBold,
                  textAlign: TextAlign.left),
              const SizedBox(height: 4),
              exploreItem.description != ""
                  ? Text(exploreItem.description!,
                      key: const Key("itemDescription"),
                      maxLines: 1,
                      style: normalTextStyle,
                      textAlign: TextAlign.left)
                  : Container()
            ],
          ),
          width: imageSize,
          height: 275,
        ),
        onPressed: () => onPressed(exploreItem.id),
        padding: isLastItem
            ? _styles.lastContainerPadding
            : _styles.containerPadding);
  }
}
