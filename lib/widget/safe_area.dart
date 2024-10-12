import 'dart:io';

import 'package:flutter/material.dart';

class AndroidSafeArea extends StatelessWidget {
  const AndroidSafeArea({
    super.key,
    required this.child,
    this.top,
    this.bottom,
  });

  final Widget child;
  final bool? top;
  final bool? bottom;

  @override
  Widget build(BuildContext context) {
    var isAndroid = Platform.isAndroid;
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: top ?? isAndroid,
        bottom: bottom ?? isAndroid,
        child: child,
      ),
    );
  }
}
