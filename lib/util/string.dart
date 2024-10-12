import 'package:flutter/material.dart';
import 'package:rush_sdk/util/commons.dart' as common;
import 'package:rush_sdk/util/date.dart';
import 'package:rush_sdk/util/number.dart';

extension StringExtension on String {
  Color toColor() => Color(
        int.parse(
          StringBuffer("FF${replaceFirst("#", "")}").toString(),
          radix: 16,
        ),
      );

  String format(String dateFormat) =>
      common.customDateFormat(dateFormat, DateTime.parse(this));

  String maskingByLang() {
    var regxp = RegExp(r'''[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]''');
    if (regxp.matchAsPrefix(this) != null) {
      return masking(1);
    } else {
      return masking(3);
    }
  }

  String masking(int start, {String? char = "*"}) {
    String result = "";
    for (var i = 0; i < length; i++) {
      if (i >= start) {
        result += char!;
      } else {
        result += this[i];
      }
    }

    return result;
  }

  int toInt() => int.parse(this);
  String comma() => int.parse(this).comma();

  String onlyNumber() => replaceAll(RegExp(r"[^0-9]"), "");
  int? onlyNumberToInt() => int.tryParse(onlyNumber());

  String getTimeLeft(String endTime) =>
      DateTime.parse(this).getTimeLeft(DateTime.parse(endTime));
  String formatKRW() => common.formatKRW(int.parse(this));
}
