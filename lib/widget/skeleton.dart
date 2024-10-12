import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWrapper extends StatelessWidget {
  const SkeletonWrapper({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade100,
      highlightColor: highlightColor ?? Colors.white,
      enabled: true,
      child: child,
    );
  }
}

/// ### [Skeleton]을 사용하는 위젯을 [SkeletonWrapper]로 감싸야 정상 작동 합니다.
/// ```
/// SkeletonWrapper(
///   child: Skeleton.sizedBox(
///     width: getWidth(context),
///     height: 398,
///   ),
/// ),
/// ```
class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.child,
  });
  final Widget child;

  factory Skeleton.sizedBox({double? width, double? height}) {
    return Skeleton(
      child: ColoredBox(
        color: Colors.white,
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }

  factory Skeleton.squareBox({required double size}) {
    return Skeleton.sizedBox(width: size, height: size);
  }

  factory Skeleton.roundedBox({
    double? width,
    double? height,
    double? round,
  }) {
    return Skeleton(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(round ?? 6),
        ),
        width: width,
        height: height,
      ),
    );
  }

  factory Skeleton.circle({
    required double size,
  }) {
    return Skeleton(
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
