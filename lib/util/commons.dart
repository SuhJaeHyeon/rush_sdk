import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/toast.dart';

String formatKRW(
  int? number, {
  bool won = true,
  bool allowMinus = false,
  bool addPlus = false,
  bool space = false,
}) {
  if (number == null) {
    return '0${won ? '원' : ''}';
  }

  if (number < 0 && allowMinus) {
    return "-${formatKRW(-number, won: won)}";
  }

  if (number > 0 && addPlus) {
    return "+${formatKRW(number, won: won)}";
  }

  if (number <= 0) {
    return '0${won ? '원' : ''}';
  }

  try {
    int inputNumber = number;
    List<String> unitWords = ['', '만', '억'];
    int splitUnit = 10000;
    List<int> resultArray = [0, 0, 0];
    String resultString = '';

    for (int i = 0; i < unitWords.length; i++) {
      int unitResult =
          (inputNumber % math.pow(splitUnit, i + 1)) ~/ math.pow(splitUnit, i);
      unitResult = unitResult.floor();
      if (unitResult > 0) {
        resultArray[i] = unitResult;
      }
    }

    if (space && resultArray.where((e) => e > 0).length == 1) {
      unitWords = unitWords.map((e) => ' $e').toList();
    }

    for (int i = 0; i < resultArray.length; i++) {
      if (resultArray[i] == 0) continue;
      resultString = resultArray[i].toString() + unitWords[i] + resultString;
    }

    return resultString + (won ? '원' : '');
  } catch (e) {
    print(e);
    return '0${won ? '원' : ''}';
  }
}

String twoDigits(int n) => n.toString().padLeft(2, '0');

int priceFormat(String text) {
  return int.parse(text.replaceAll(',', ''));
}

String getPercent(int original, int applied) {
  return "${((1 - (applied / original)) * 100).round()}%";
}

String diffDateTime(DateTime date, DateTime endDate) {
  final time = endDate.difference(date);
  if (time.inSeconds < 60) {
    return '${time.inSeconds}초 전';
  } else if (time.inSeconds < (60 * 60)) {
    return '${time.inMinutes}분 전';
  } else if (time.inSeconds < (60 * 60 * 24)) {
    return '${time.inHours}시간 전';
  } else {
    return '${time.inDays}일 전';
  }
}

String durationToTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

NumberFormat get formatCurrency => NumberFormat.simpleCurrency(
      locale: 'ko_KR',
      name: '',
      decimalDigits: 0,
    );

Uri getUri(String url) {
  return Uri.parse(url);
}

Map<String, String> getHeaders(String idToken) {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $idToken',
  };
}

int getInDays(DateTime dateTime) {
  final DateTime customDate = DateTime(
    dateTime.toLocal().year,
    dateTime.toLocal().month,
    dateTime.toLocal().day,
  );

  final DateTime nowDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final int inDays = nowDate.difference(customDate).inDays;

  return inDays;
}

String customDateFormat(
  String format,
  DateTime dateTime, {
  String? localeName,
}) {
  return DateFormat(
    format,
    localeName ?? Platform.localeName,
  ).format(dateTime.toLocal());
}

String customDateFormatString(
  String format,
  String dateTime, {
  String? localeName,
}) {
  return customDateFormat(
    format,
    DateTime.parse(dateTime),
    localeName: localeName,
  );
}

Future<void> customLaunchUrl(
  BuildContext context, {
  required String url,
}) async {
  try {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: Platform.isIOS
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
    } else {
      errorToast(context: context, title: '', message: '');
    }
  } catch (e) {
    errorToast(context: context, title: '', message: '');
    print(['customLaunchUrl', e]);
  }
}

Future<void> copyText({
  required BuildContext context,
  required String text,
  required String? message,
}) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text: text,
      ),
    );

    if (message != null) {
      customToast(
        context: context,
        message: message,
      );
    }
  } catch (e) {
    errorToast(context: context, title: '', message: '');
    print(['copyText', e]);
  }
}

List shuffle(List items) {
  var random = math.Random();

  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

double nanToZero(double value) {
  if (value.isNaN) {
    return 0;
  } else {
    return value;
  }
}

T maxCompare<T>(T a, T b, int Function(T a, T b) compare) =>
    compare(a, b) > 0 ? a : b;

T minCompare<T>(T a, T b, int Function(T a, T b) compare) =>
    compare(a, b) < 0 ? a : b;
