import 'dart:developer';

class Logger {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => print('** $text. isError: [$isError]'));
  }
}

void red(dynamic message) {
  log("\x1b[38;5;9m${message.toString()}");
}

void yellow(dynamic message) {
  log("\x1b[33m${message.toString()}");
}

void purple(dynamic message) {
  log("\x1b[35m${message.toString()}");
}

void cyan(dynamic message) {
  log("\x1b[36m${message.toString()}");
}

void white(dynamic message) {
  log("\x1b[37m${message.toString()}");
}
