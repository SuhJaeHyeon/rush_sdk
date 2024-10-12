// ignore_for_file: constant_identifier_names

import 'package:flutter/services.dart';

class EpicMethodChannel extends MethodChannel {
  static const METHOD_CHANNEL_NAME = 'io.epiccorp.one/methodChannel';

  EpicMethodChannel() : super(METHOD_CHANNEL_NAME);

  Future<String?> intentParse<String>(String intent) async {
    return await invokeMethod("intentParse", {'intent': intent});
  }

  Future<String?> marketUrl<String>(String intent) async {
    return await invokeMethod("marketUrl", {'intent': intent});
  }
}
