class Bool {
  bool _value;
  Bool(this._value);

  Function(bool)? callback;

  set value(bool value) {
    _value = value;
    callback?.call(_value);
  }

  bool get value => _value;

  listen(Function(bool) callback) {
    this.callback = callback;
  }
}

// void toggleBoolValue(Bool boolWrapper) {
//   // boolWrapper.value = !boolWrapper.value; // 변수를 반전
// }

class Int {
  int value;
  Int(this.value);
}
