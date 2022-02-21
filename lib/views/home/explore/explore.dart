import 'package:flutter/cupertino.dart';

import '../../../model/explore_model.dart';
import './components/explore_item.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ExploreItem(
      exploreItem: exploreItems[0],
      onBookmarkPressed: _onBookmarkPressed,
      onPressed: _onPressed,
    ));
  }
}
