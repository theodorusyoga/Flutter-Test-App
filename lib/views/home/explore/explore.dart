import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../model/explore_model.dart';
import './components/explore_item.dart';
import 'components/explore_title.dart';
import './styles.dart';

class Explore extends StatelessWidget {
  Explore(
      {Key? key,
      required this.explore})
      : super(key: key);

  final ExploreModel explore;

  final _styles = ExploreStyles();

  void _onBookmarkPressed(String id) {
    // implement bookmark pressed
  }

  void _onPressed(String id) {
    // implement onpressed
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ExploreItem(
      exploreItem: explore.exploreItems[index],
      onBookmarkPressed: _onBookmarkPressed,
      onPressed: _onPressed,
      isLastItem: index == explore.exploreItems.length - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          child: ExploreTitle(
              title: explore.title,
              description: explore.description,
              onPressed: explore.onPressed),
          padding: _styles.titlePadding,
        ),
        Container(
            width: _width,
            padding: _styles.containerPadding,
            height: 305,
            child: ScrollSnapList(
              itemBuilder: _buildListItem,
              itemCount: explore.exploreItems.length,
              itemSize: 200,
              onItemFocus: (index) {},
              selectedItemAnchor: SelectedItemAnchor.START,
              endOfListTolerance: 16,
            ))
      ],
    );
  }
}
