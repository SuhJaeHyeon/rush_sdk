import 'package:flutter/material.dart';

class AppDefaultTextStyle extends StatelessWidget {
  final Widget child;

  const AppDefaultTextStyle({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.black,
      ),
      textHeightBehavior: TextHeightBehavior(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      child: child,
    );
  }
}
