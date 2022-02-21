import 'package:flutter/material.dart';

import '../../../model/point_model.dart';
import './components/pointitem.dart';
import './styles.dart';

var pointItems = <PointModel>[
  PointModel(icon: Icons.currency_exchange, pointName: 'Points', point: 34000),
  PointModel(
      icon: Icons.currency_exchange,
      pointName: 'UANGKU',
      isNotActivated: true,
      activationPressed: () {}),
  PointModel(
      icon: Icons.currency_exchange,
      pointName: 'PayLater',
      isNotActivated: true,
      activationActionName: 'View',
      activationPressed: () {}),
];

class Points extends StatelessWidget {
  Points({Key? key}) : super(key: key);

  final _styles = PointsStyles();

  @override
  Widget build(BuildContext context) {
    final row = Row(
        children: pointItems
            .map<Widget>((pointItem) =>
                Expanded(flex: 3, child: PointItem(pointModel: pointItem)))
            .toList());

    return Container(
      child: row,
      margin: _styles.containerMargin,
      padding: _styles.containerPadding,
      decoration: _styles.containerDecoration,
    );
  }
}
