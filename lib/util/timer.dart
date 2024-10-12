import 'dart:async';

class TimerManager {
  final String type;
  final Duration duration;
  final Function callback;
  Timer timer;

  TimerManager._(this.type, this.duration, this.callback, this.timer);

  factory TimerManager.periodic(
          Duration duration, void Function(Timer timer) callback) =>
      TimerManager._(
        "periodic",
        duration,
        callback,
        Timer.periodic(duration, callback),
      );

  factory TimerManager.run(Duration duration, void Function() callback) =>
      TimerManager._(
        "run",
        duration,
        callback,
        Timer(duration, callback),
      );

  cancel() {
    timer.cancel();
  }

  reset() {
    timer.cancel();
    if (type == "periodic") {
      timer = Timer.periodic(duration, callback as void Function(Timer timer));
    } else {
      timer = Timer(duration, callback as void Function());
    }
  }
}
