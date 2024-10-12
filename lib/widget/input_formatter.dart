import 'package:flutter/material.dart';
import 'package:rush_sdk/util/number.dart';
import 'package:rush_sdk/util/string.dart';
import 'package:rush_sdk/widget/toast.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import '../util/commons.dart';

class NumberInputFormatter extends CustomTextInputFormatter {
  final int decimalPoint;

  NumberInputFormatter({
    required this.decimalPoint,
  });

  @override
  String _formatPattern(String digits) {
    if (digits.isEmpty) return '';

    final int firstDigitsToInt = int.parse(digits.split('.').first);

    String firstText = formatCurrency.format(firstDigitsToInt);

    if (digits.split('.').first.length > 10) {
      firstText = digits.substring(0, 10);

      final int firstTextToInt = int.parse(firstText.split('.').first);

      firstText = formatCurrency.format(firstTextToInt);
    }

    late String result;

    if (digits.contains('.')) {
      String lastText = digits.split('.').last;

      if (lastText.length > decimalPoint) {
        lastText = lastText.substring(0, decimalPoint);
      }

      result = firstText + '.' + lastText;
    } else {
      result = firstText;
    }

    return result;
  }

  @override
  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return FilteringTextInputFormatter.allow(
      RegExp('[0-9]+([.])?'),
    ).formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == '.' || RegExp('[0-9]+([.])?').firstMatch(s) != null;
  }
}

abstract class CustomTextInputFormatter extends TextInputFormatter {
  TextEditingValue? _lastNewValue;

  String _formatPattern(String digits);

  TextEditingValue _formatValue(
      TextEditingValue oldValue, TextEditingValue newValue);

  bool _isUserInput(String s);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }

    _lastNewValue = newValue;

    newValue = _formatValue(oldValue, newValue);

    final String newText = _formatPattern(newValue.text);

    int selectionIndex = newValue.selection.end;
    int insertCount = 0;
    int inputCount = 0;

    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class PointInputFormmatter extends TextInputFormatter {
  final int pointCanUse;
  final int limit;
  const PointInputFormmatter(this.pointCanUse, this.limit);

  int getPoint(int point) => min(
        limit,
        min(pointCanUse, point),
      );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = getPoint(newValue.text.onlyNumberToInt() ?? 0).comma();
    return newValue.copyWith(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }
}

class TradeAgencyPriceUpdateFormatter extends TextInputFormatter {
  final int limit;
  final int minPercent;

  const TradeAgencyPriceUpdateFormatter({
    required this.limit,
    required this.minPercent,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue, 
  ) {
    final newPrice = newValue.text.onlyNumberToInt() ?? 0;
    final int price;
    if (newPrice > limit) {
      price = limit;
      errorToast(
          message: "판매가는 -$minPercent%(${limit.formatKRW()})부터 수정 가능합니다");
    } else {
      price = newPrice;
    }

    final text = "₩ ${price.comma()}";
    return newValue.copyWith(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }
}

class CurrencyLengthFormatter extends TextInputFormatter {
  final int limit;
  final void Function(bool isOver) onOver;

  CurrencyLengthFormatter({
    required this.limit,
    required this.onOver,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.replaceAll(",", "").length > limit) {
      onOver(true);
      return oldValue;
    }

    return newValue;
  }
}

class CurrencyCommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    var newText = newValue.text.replaceAll(",", "").comma();

    return newValue.copyWith(
      text: newText,
      selection: newValue.selection.copyWith(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
    );
  }
}
