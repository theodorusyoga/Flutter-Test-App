import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../model/explore_model.dart';
import './components/explore_item.dart';
import './styles.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

  final _styles = ExploreStyles();

  final exploreItems = <ExploreModel>[
    ExploreModel(
      id: 'uuid-example-1',
      name: 'All In One - Lookal Kitchen BSD',
      description: 'Indonesian',
      location: 'Serpong',
      imagePath: 'lib/assets/images/sambal_matah.jpg',
    ),
    ExploreModel(
      id: 'uuid-example-2',
      name: 'All In One - Lookal Kitchen BSD',
      description: 'Indonesian',
      location: 'Serpong',
      imagePath: 'lib/assets/images/sambal_matah.jpg',
    ),
    ExploreModel(
      id: 'uuid-example-3',
      name: 'All In One - Lookal Kitchen BSD',
      description: 'Indonesian',
      location: 'Serpong',
      imagePath: 'lib/assets/images/sambal_matah.jpg',
    ),
    ExploreModel(
      id: 'uuid-example-4',
      name: 'All In One - Lookal Kitchen BSD',
      description: 'Indonesian',
      location: 'Serpong',
      imagePath: 'lib/assets/images/sambal_matah.jpg',
    )
  ];

  void _onBookmarkPressed(String id) {
    // implement bookmark pressed
  }

  void _onPressed(String id) {
    // implement onpressed
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ExploreItem(
      exploreItem: exploreItems[index],
      onBookmarkPressed: _onBookmarkPressed,
      onPressed: _onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Container(
        width: _width,
        padding: _styles.containerPadding,
        height: 305,
        child: ScrollSnapList(
            itemBuilder: _buildListItem,
            itemCount: exploreItems.length,
            itemSize: 200,
            onItemFocus: (index) {},
            selectedItemAnchor: SelectedItemAnchor.START,
            ));
  }
}
