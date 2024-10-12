import 'package:flutter/material.dart';
import 'package:rush_sdk/widget/alert.dart';

class EpiconeNetworkError extends Error {
  final int? code;
  final String? errorMsg;

  EpiconeNetworkError([this.code, this.errorMsg]) {
    print(toString());
  }

  @override
  String toString() {
    if (code == null && errorMsg == null) {
      return "Network Failed";
    }

    return "=== EpiconeNetworkError ===${_print("code", code)}${_print("errorTitle", errorMsg)}";
  }

  void _showDialog(BuildContext context){
    code == 400 ? onlyTitleOnebuttonAlert(context, title: errorMsg ?? "") : networkAlert(context);
  }

  String _print(String name, dynamic value) {
    if (value == null) return "";
    return "\n$name: $value";
  }

  static void showDialog(dynamic error, BuildContext context) {
    if (error is EpiconeNetworkError) {
      error._showDialog(context);
    } else {
      networkAlert(context);
    }
  }
}
