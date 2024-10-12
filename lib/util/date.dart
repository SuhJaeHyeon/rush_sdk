import 'package:rush_sdk/util/commons.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// ### created_at, updated_at
  /// ### `yyyy-MM-ddTHH:mm:ss+00:00`
  String toGraphqlFormat() => toUtcFormat('yyyy-MM-ddTHH:mm:ss+00:00');

  String toUtcFormat(String formatString) =>
      DateFormat(formatString).format(toUtc());
  String format(String formatString) => customDateFormat(formatString, this);

  String getTimeLeft(DateTime endTime) {
    return endTime.difference(this).getTimeLeft();
  }
}

extension DurationExtension on Duration {
  String getTimeLeft() {
    if (isNegative) return "00:00:00";
    return [
      inHours.toString().padLeft(2, "0"),
      (inMinutes % 60).toString().padLeft(2, "0"),
      (inSeconds % 60).toString().padLeft(2, "0"),
    ].join(":");
  }
}
