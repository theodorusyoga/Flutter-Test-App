import 'package:flutter/cupertino.dart';

import '../../../../model/point_model.dart';
import '../../../../assets/colors.dart';
import './styles.dart';
import '../../../../helpers/currency.dart';

class PointItem extends StatelessWidget {
  PointItem({Key? key, required this.pointModel}) : super(key: key);

  final PointModel pointModel;
  final _styles = PointStyles();

  @override
  Widget build(BuildContext context) {
    final rowIconText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child:
              Icon(pointModel.icon, size: 16, color: colors[ColorName.white]),
          padding: _styles.pointItemIconPadding,
        ),
        Text(pointModel.pointName, style: _styles.pointItemTitleText)
      ],
    );

    return Container(
      child: Column(
        children: [
          rowIconText,
          const SizedBox(height: 4),
          pointModel.isNotActivated != null &&
                  pointModel.activationPressed != null
              ? CupertinoButton(
                  child: Text(
                    pointModel.activationActionName ?? '',
                    style: _styles.buttonText,
                  ),
                  onPressed: () => (pointModel.activationPressed ?? () {})(),
                  padding: _styles.buttonPadding,
                  minSize: 0,
                  color: colors[ColorName.white],
                  borderRadius: _styles.buttonBorderRadius)
              : Text((pointModel.point ?? 0).toCurrencyWithoutSymbol(),
                  style: _styles.pointItemText)
        ],
      ),
      padding: _styles.pointItemPadding,
    );
  }
}
