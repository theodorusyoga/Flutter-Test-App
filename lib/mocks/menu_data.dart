import 'package:flutter/material.dart';

import '../model/menu_model.dart';
import '../assets/colors.dart';

List<MenuModel> menuMocks = <MenuModel>[
  MenuModel(
      icon: Icons.flight,
      menuName: "Flights",
      bgColor: colors[ColorName.flightBlue]),
  MenuModel(
      icon: Icons.maps_home_work,
      menuName: "Hotels",
      bgColor: colors[ColorName.hotelDarkBlue]),
  MenuModel(
      icon: Icons.check,
      menuName: "Xperience",
      bgColor: colors[ColorName.xperiencePink]),
  MenuModel(
      icon: Icons.fastfood,
      menuName: "Eats",
      bgColor: colors[ColorName.orangeEats]),
  MenuModel(
      icon: Icons.attach_money,
      menuName: "Financial",
      bgColor: colors[ColorName.financialDarkBlue]),
  // DUPLICATED FOR SECOND ROW
  MenuModel(
      icon: Icons.train,
      menuName: "Trains",
      iconColor: colors[ColorName.flightBlue],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.car_rental,
      menuName: "Cars",
      iconColor: colors[ColorName.hotelDarkBlue],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.airport_shuttle,
      menuName: "Airport Transfer",
      iconColor: colors[ColorName.orangeEats],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.phone,
      menuName: "Top Up & Data",
      iconColor: colors[ColorName.financialDarkBlue],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.health_and_safety,
      menuName: "Healthcare",
      iconColor: colors[ColorName.xperiencePink],
      bgColor: colors[ColorName.tertiary]),
  // DUPLICATED FOR THIRD ROW
  MenuModel(
      icon: Icons.bus_alert,
      menuName: "Bus",
      iconColor: colors[ColorName.greenBus],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.train_sharp,
      menuName: "JR Pass",
      iconColor: colors[ColorName.primary],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.holiday_village,
      menuName: "Holiday Stays",
      iconColor: colors[ColorName.greenGrass],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.plus_one,
      menuName: "Insurance",
      iconColor: colors[ColorName.financialDarkBlue],
      bgColor: colors[ColorName.tertiary]),
  MenuModel(
      icon: Icons.currency_exchange,
      menuName: "Budget Planner",
      iconColor: colors[ColorName.orangeEats],
      bgColor: colors[ColorName.tertiary]),
];
