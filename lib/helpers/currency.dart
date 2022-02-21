import 'package:intl/intl.dart';

class CurrencyHelpers {
  final _currencyFormatWithoutSymbol = '#,##0';
  final locale = 'ID';

  String toCurrencyWithoutSymbol(int text) {
    final numberFormat = NumberFormat(_currencyFormatWithoutSymbol, locale);
    return numberFormat.format(text);
  }
}

extension CurrencyParsing on int {
  String toCurrencyWithoutSymbol() {
    return CurrencyHelpers().toCurrencyWithoutSymbol(this);
  }
}
