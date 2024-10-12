import 'package:flutter/material.dart';

class BadgeRedDot extends StatelessWidget {
  const BadgeRedDot({
    super.key,
    required this.isShow,
    required this.child,
    this.top,
    this.right,
  });

  final bool isShow;
  final Widget child;
  final double? top;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (isShow)
          Positioned(
            top: top ?? 0,
            right: right ?? -2.5,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE45050),
              ),
            ),
          ),
      ],
    );
  }
}
