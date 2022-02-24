import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:tvlk_test_app/assets/colors.dart';
import 'package:tvlk_test_app/model/menu_model.dart';

class MenuMockFunction extends Mock {
  void onPressed();
}

final MenuModel menuMock = MenuModel(
    icon: Icons.flight,
    iconColor: colors[ColorName.white],
    menuName: "Flights",
    bgColor: colors[ColorName.flightBlue]);
