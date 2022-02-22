import './explore_item_model.dart';

class ExploreModel {
  String title;
  String description;
  Function onPressed;
  List<ExploreItemModel> exploreItems;

  ExploreModel(
      {required this.title,
      required this.description,
      required this.onPressed,
      required this.exploreItems});
}
