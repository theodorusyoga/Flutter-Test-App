import './explore_item_model.dart';

class ExploreModel {
  String id;
  String title;
  String description;
  List<ExploreItemModel> exploreItems;

  ExploreModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.exploreItems});
}
