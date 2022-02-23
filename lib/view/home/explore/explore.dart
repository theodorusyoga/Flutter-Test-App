import 'package:tvlk_test_app/model/explore_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:provider/provider.dart';

import '../../../model/explore_model.dart';
import '../../../view_model/explore.dart';
import './components/explore_item.dart';
import 'components/explore_title.dart';
import './styles.dart';

class Explore extends StatelessWidget {
  Explore({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final _styles = ExploreStyles();

  void _onBookmarkPressed(String id) {
    // implement bookmark pressed
  }

  void _onPressed(String id) {
    // implement onpressed
  }

  Widget _buildListItem(
      BuildContext context, int index, List<ExploreItemModel> items) {
    return ExploreItem(
      exploreItem: items[index],
      onBookmarkPressed: _onBookmarkPressed,
      onPressed: _onPressed,
      isLastItem: index == items.length - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final exploreViewModel = Provider.of<ExploreViewModel>(context);
    exploreViewModel.loadData(index);
    final ExploreModel explore = exploreViewModel.explore;

    return Column(
      children: [
        explore.title != "" || explore.description != "" ?
        Container(
          child: ExploreTitle(
              title: explore.title,
              description: explore.description,
              onPressed: explore.onPressed),
          padding: _styles.titlePadding,
        ) : Container(),
        Container(
            width: _width,
            padding: _styles.containerPadding,
            height: 300,
            child: ScrollSnapList(
              itemBuilder: (context, index) =>
                  _buildListItem(context, index, explore.exploreItems),
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
