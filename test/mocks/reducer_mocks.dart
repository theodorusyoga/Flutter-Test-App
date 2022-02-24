import 'package:flutter/material.dart';
import 'package:tvlk_test_app/assets/colors.dart';
import 'package:tvlk_test_app/model/explore_item_model.dart';
import 'package:tvlk_test_app/model/explore_model.dart';
import 'package:tvlk_test_app/model/menu_model.dart';

List<ExploreModel> mockExploreModels = [
  ExploreModel(
      id: 'uuid-1',
      title: 'Discover your new favorite meal',
      description: 'Inspired by Eats you explored',
      exploreItems: <ExploreItemModel>[
        ExploreItemModel(
          id: 'uuid-example-1',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
      ])
];

List<MenuModel> _mockMenuModels = [
  MenuModel(
      icon: Icons.flight,
      menuName: "Flights",
      bgColor: colors[ColorName.flightBlue]),
  MenuModel(
      icon: Icons.maps_home_work,
      menuName: "Hotels",
      bgColor: colors[ColorName.hotelDarkBlue])
];

List<List<MenuModel>> mockMenus = [_mockMenuModels];
