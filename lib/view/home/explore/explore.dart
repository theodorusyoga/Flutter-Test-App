import 'package:flutter_redux/flutter_redux.dart';
import 'package:tvlk_test_app/model/explore_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../redux/state.dart';
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

    return StoreConnector<TvlkTestAppState, ExploreViewModel>(
      builder: (_, viewModel) => Column(
        children: [
          viewModel.explore.title != "" || viewModel.explore.description != ""
              ? Container(
                  child: ExploreTitle(
                      title: viewModel.explore.title,
                      description: viewModel.explore.description,
                      onPressed: viewModel.explore.onPressed),
                  padding: _styles.titlePadding,
                )
              : Container(),
          Container(
              width: _width,
              padding: _styles.containerPadding,
              height: 300,
              child: ScrollSnapList(
                itemBuilder: (context, index) => _buildListItem(
                    context, index, viewModel.explore.exploreItems),
                itemCount: viewModel.explore.exploreItems.length,
                itemSize: 200,
                onItemFocus: (index) {},
                selectedItemAnchor: SelectedItemAnchor.START,
                endOfListTolerance: 16,
              ))
        ],
      ),
      converter: (store) => ExploreViewModel.fromStore(store, index),
    );
  }
}
