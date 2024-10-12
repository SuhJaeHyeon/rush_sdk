import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class Sticky extends StatelessWidget {
  const Sticky({
    super.key,
    this.headerBuilder,
    required this.sliver,
    this.isHeaderShow = true,
  });

  final Widget Function()? headerBuilder;
  final Widget sliver;
  final bool? isHeaderShow;

  @override
  Widget build(BuildContext context) {
    if (headerBuilder == null || !isHeaderShow!) {
      return sliver;
    }

    return SliverStickyHeader(
      header: headerBuilder!(),
      sliver: sliver,
    );
  }
}
