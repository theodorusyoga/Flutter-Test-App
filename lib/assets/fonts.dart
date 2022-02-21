import '../assets/colors.dart';
import 'package:flutter/cupertino.dart';

final TextStyle regularTextStyle = TextStyle(
  fontSize: 12,
  color: colors[ColorName.primary],
);

final TextStyle regularTextStyleBold =
    regularTextStyle.merge(const TextStyle(fontWeight: FontWeight.w600));
