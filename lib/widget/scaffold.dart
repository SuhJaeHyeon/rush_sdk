import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rush_sdk/widget/permission.dart';

class ScaffoldPermission extends StatelessWidget {
  const ScaffoldPermission({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.floatingActionButtonLocation,
    this.systemUiOverlayStyle,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle ?? SystemUiOverlayStyle.dark,
      child: PermissionPage(
        child: Scaffold(
          appBar: appBar,
          body: body,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
        ),
      ),
    );
  }
}
