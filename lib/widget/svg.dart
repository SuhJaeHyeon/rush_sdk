import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGAsset extends StatelessWidget {
  const SVGAsset(
    this.assetPath, {
    super.key,
    this.size,
    this.color,
    this.height,
    this.width,
  });

  final String assetPath;
  final double? size;
  final Color? color;

  /// ### [size] 보다 [height]가 우선이다.
  final double? height;

  /// ### [size] 보다 [width]가 우선이다.
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? size,
      width: width ?? size,
      child: SvgPicture.asset(
        assetPath,
        width: height ?? size,
        height: width ?? size,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}
