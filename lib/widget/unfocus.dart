import 'package:flutter/material.dart';

class UnFocus extends StatelessWidget {
  const UnFocus({
    super.key,
    required this.child,
  });

  final Widget child;

  static void unfocus(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: child,
    );
  }
}
