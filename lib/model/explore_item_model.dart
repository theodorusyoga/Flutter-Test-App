class ExploreItemModel {
  String id;
  String name;
  String? description;
  String location;
  String imagePath;

  ExploreItemModel(
      {required this.id,
      required this.name,
      this.description,
      required this.location,
      required this.imagePath});
}
