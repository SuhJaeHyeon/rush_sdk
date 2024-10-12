import 'dart:io';
import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getBottom(BuildContext context) {
  if (MediaQuery.of(context).viewPadding.bottom == 0) {
    return 20;
  } else {
    return 35;
  }
}

double getToastBottom(BuildContext context) {
  late double bottom;

  if (Platform.isIOS) {
    if (MediaQuery.of(context).viewPadding.bottom == 0) {
      bottom = 20;
    } else {
      bottom = 0;
    }
  } else {
    bottom = getBottom(context);
  }

  return bottom;
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double getAppBarHeight() {
  return AppBar().preferredSize.height;
}

double getKeyboardHeight(BuildContext context) {
  return getHeight(context) - MediaQuery.of(context).viewInsets.bottom;
}
