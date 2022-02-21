import 'package:flutter/cupertino.dart';

class PointModel {
  IconData icon;
  String pointName;
  int? point;
  bool? isNotActivated;
  String? activationActionName = 'Activate';
  Function? activationPressed;

  PointModel(
      {required this.icon,
      required this.pointName,
      this.point,
      this.isNotActivated,
      this.activationActionName = 'Activate',
      this.activationPressed});
}
