import 'package:flutter/material.dart';

class Pop extends StatelessWidget {
  const Pop({
    super.key,
    required this.child,
    this.canPop,
  });

  final bool? canPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (canPop ?? false) ? null : () async => false,
      child: child,
    );
  }
}
