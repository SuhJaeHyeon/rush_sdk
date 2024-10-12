import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rush_sdk/util/size.dart';

class EpicSliverRefresh extends StatelessWidget {
  const EpicSliverRefresh({
    super.key,
    required this.onRefresh,
    required this.builder,
    this.backgroundColor,
  });

  final Future<void> Function() onRefresh;
  final Widget Function(double progress, bool isOnRefresh, double width)
      builder;
  final Color? backgroundColor;

  factory EpicSliverRefresh.onlyLogo({
    required String logo,
    Color? backgroundColor,
  }) {
    return EpicSliverRefresh(
      backgroundColor: backgroundColor,
      onRefresh: () async {},
      builder: (progress, isOnRefresh, width) {
        return Image.asset(
          logo,
          width: width,
          fit: BoxFit.fitWidth,
        );
      },
    );
  }

  factory EpicSliverRefresh.indicator({
    required String logo,
    required Future<void> Function() onRefresh,
    Color? backgroundColor,
  }) {
    return EpicSliverRefresh(
      backgroundColor: backgroundColor,
      onRefresh: onRefresh,
      builder: (progress, isOnRefresh, width) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Image.asset(
              logo,
              width: width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(width: 10),
            isOnRefresh
                ? CupertinoActivityIndicator()
                : CupertinoActivityIndicator.partiallyRevealed(
                    progress: progress,
                  )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance,
          refreshIndicatorExtent) {
        double progress = min(pulledExtent / refreshTriggerPullDistance, 1);
        return ColoredBox(
          color: backgroundColor ?? Colors.white,
          child: Opacity(
            opacity: progress,
            child: Container(
              margin: EdgeInsets.only(top: pulledExtent / 2.5),
              child: Column(
                children: [
                  builder(
                    progress,
                    refreshState == RefreshIndicatorMode.armed,
                    getWidth(context) / 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
