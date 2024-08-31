import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currencyPTPT {
    final currencyFormat = NumberFormat.currency(locale: 'pt-PT', symbol: r'€');
    return currencyFormat.format(this);
  }
}
  