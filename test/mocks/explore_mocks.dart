import 'package:mockito/mockito.dart';
import 'package:tvlk_test_app/model/explore_item_model.dart';

class ExploreMockFunction extends Mock {
  void onPressed(String id);
  void onBookmarkPressed(String id);
}

final ExploreItemModel exploreItemMock = ExploreItemModel(
    id: 'uuid-example-1',
    name: 'All In One - Lookal Kitchen BSD',
    description: 'Indonesian',
    location: 'Serpong',
    imagePath: 'lib/assets/images/sambal_matah.jpg');
