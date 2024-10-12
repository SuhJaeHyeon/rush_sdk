import 'package:flutter/foundation.dart';

class TimeLapse {
  String? label;
  DateTime? startTime;

  TimeLapse([this.label]);

  /// ## 생성과 동시에 시작한다.
  factory TimeLapse.start([String? label]) {
    return TimeLapse(label)..start();
  }

  void start([String? label]) {
    if (!kDebugMode) return;
    label ??= this.label;

    startTime = DateTime.now();
    print("======================================");
    print("========== TIME LAPSE START ==========");
    _displayLabel(label);
    _unexpectableLabel(startTime.toString());
  }

  void end([String? label]) {
    if (!kDebugMode) return;

    if (startTime == null) {
      print("Must call `start` function before end function called");
      return;
    }

    var end = DateTime.now();
    print("======================================");
    print("========== TIME LAPSE END ============");
    _displayLabel(label);
    _unexpectableLabel(end.toString());
    print("===== TIME DIFFERENCE FROM START =====");
    _unexpectableLabel(end.difference(startTime!).inMilliseconds.toString());
  }

  void _displayLabel(String? label) {
    label ??= this.label;
    if (label != null) {
      _unexpectableLabel(label);
    }
  }

  void _unexpectableLabel(String label) {
    print("=== $label ".padRight(38, "="));
  }
}
