import 'dart:math';

import 'package:intl/intl.dart';
import 'package:rush_sdk/util/commons.dart' as common;

extension IntExtension on int {
  String comma() {
    return NumberFormat.simpleCurrency(
      locale: 'ko_KR',
      name: '',
      decimalDigits: 0,
    ).format(this);
  }

  String formatKRW({bool? allowMinus, bool? addPlus}) {
    return common.formatKRW(
      this,
      allowMinus: allowMinus ?? false,
      addPlus: addPlus ?? false,
    );
  }

  String formatKRWWithComma() {
    final value = formatKRW();
    final numberPart = value.replaceAll(RegExp(r'[^0-9]'), '');
    final formattedNumber = int.parse(numberPart).comma();
    final nonNumberPart = value.replaceAll(RegExp(r'[0-9]'), '');
    return '$formattedNumber $nonNumberPart';
  }

  String formatCurrency() {
    return common.formatCurrency.format(this);
  }

  int flat(int digit) {
    var n = pow(10, digit);
    return ((this ~/ n) * n).toInt();
  }

  int remove(int digit) {
    var n = pow(10, digit);
    return this ~/ n;
  }

  Iterable<String> spllit() {
    return toString().split('');
  }

  static int? tryParseOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) {
      if (value.isEmpty) return null;
      return int.tryParse(value);
    }
    return null;
  }
}
