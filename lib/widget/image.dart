import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rush_sdk/util/cache.dart';
import 'package:rush_sdk/widget/loading.dart';
import 'package:rush_sdk/widget/svg.dart';
import 'package:lottie/lottie.dart';


class AllImage extends StatelessWidget {
  const AllImage(
    this.source, {
    super.key,
    this.type,
    this.width,
    this.height,
    this.size,
    this.color,
    this.placeholder,
  });

  final String source;
  final String? type;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final Widget Function(BuildContext, String)? placeholder;

  @override
  Widget build(BuildContext context) {
    final sizeWith = size ?? width;
    final sizeheight = size ?? height;

    if (source.isEmpty) {
      return CachedManagedImage(
        imageUrl: "https://placehold.co/400x600/png",
        placeholder: placeholder,
        height: sizeheight,
        width: sizeWith,
      );
    }

    if (source.endsWith("svg")) {
      return SVGAsset(
        source,
        width: sizeWith,
        height: sizeheight,
        color: color,
      );
    }

    if (source.endsWith("json") || type == "json") {
      if (source.startsWith("assets")) {
        return Lottie.asset(source, height: sizeheight, width: sizeWith);
      } else {
        return Lottie.network(source, height: sizeheight, width: sizeWith);
      }
    }

    if (source.startsWith("assets")) {
      return Image.asset(
        source,
        height: sizeheight,
        width: sizeWith,
      );
    } else {
      return CachedManagedImage(
        imageUrl: source,
        placeholder: placeholder,
        height: height,
        width: sizeWith,
      );
    }
  }
}

class CachedManagedImage extends CachedNetworkImage {
  CachedManagedImage({
    super.key,
    required super.imageUrl,
    super.httpHeaders,
    super.imageBuilder,
    super.placeholder,
    super.progressIndicatorBuilder,
    super.errorWidget,
    super.fadeOutDuration = const Duration(milliseconds: 1000),
    super.fadeOutCurve = Curves.easeOut,
    super.fadeInDuration = const Duration(milliseconds: 500),
    super.fadeInCurve = Curves.easeIn,
    super.width,
    super.height,
    super.fit,
    super.alignment = Alignment.center,
    super.repeat = ImageRepeat.noRepeat,
    super.matchTextDirection = false,
    super.useOldImageOnUrlChange = false,
    super.color,
    super.filterQuality = FilterQuality.low,
    super.colorBlendMode,
    super.placeholderFadeInDuration,
    super.memCacheWidth,
    super.memCacheHeight,
    super.cacheKey,
    super.maxWidthDiskCache,
    super.maxHeightDiskCache,
    super.errorListener,
  }) : super(cacheManager: ImageCacheManager.instance);
}

class CustomImageCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double width;
  final double height;
  final String imageUrl;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  const CustomImageCard({
    Key? key,
    this.margin,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.border,
    this.borderRadius,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CachedNetworkImage(
        maxWidthDiskCache: 1024,
        maxHeightDiskCache: 1024,
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: border,
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          );
        },
        placeholder: (context, value) {
          return Container(
            width: width,
            height: height,
            child: Center(
              child: CustomLoading(),
            ),
          );
        },
        errorWidget: (context, value, error) {
          return Container(
            width: width,
            height: height,
            color: Colors.blueGrey,
          );
        },
      ),
    );
  }
}
