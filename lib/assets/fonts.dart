import '../assets/colors.dart';
import 'package:flutter/cupertino.dart';

final TextStyle regularTextStyle = TextStyle(
  fontSize: 12,
  color: colors[ColorName.primary],
);

final TextStyle secondaryTextStyle = TextStyle(
  color: colors[ColorName.secondary],
);

final TextStyle regularTextStyleBold =
    regularTextStyle.merge(const TextStyle(fontWeight: FontWeight.w600));

final TextStyle normalTextStyle =
    regularTextStyle.merge(const TextStyle(fontSize: 14));

final TextStyle normalTextStyleBold =
    regularTextStyleBold.merge(const TextStyle(fontSize: 14));

final TextStyle mediumTextStyle =
    regularTextStyle.merge(const TextStyle(fontSize: 16));

final TextStyle mediumTextStyleBold =
    regularTextStyleBold.merge(const TextStyle(fontSize: 16));

final TextStyle largeTextStyle =
    regularTextStyle.merge(const TextStyle(fontSize: 18));

final TextStyle largeTextStyleBold =
    regularTextStyleBold.merge(const TextStyle(fontSize: 18));
