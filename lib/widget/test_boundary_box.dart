
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/util/size.dart';
import 'package:rush_sdk/widget/alert.dart';

class TestBoundaryBox extends StatelessWidget {
  const TestBoundaryBox({
    super.key,
    this.color,
    required this.child,
  });

  final Color? color;
  final Widget child;

  factory TestBoundaryBox.white({
    required Widget child,
  }) =>
      TestBoundaryBox(
        color: Colors.white,
        child: child,
      );

  factory TestBoundaryBox.amber({
    required Widget child,
  }) =>
      TestBoundaryBox(
        color: Colors.amber,
        child: child,
      );

  factory TestBoundaryBox.red({
    required Widget child,
  }) =>
      TestBoundaryBox(
        color: Colors.red,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.black),
      ),
      child: child,
    );
  }
}

class TestColorBox extends StatelessWidget {
  const TestColorBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: SizedBox(
        height: 500,
        child: child,
      ),
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({super.key, required this.onTap});

  final void Function() onTap;

  factory TestButton.okAlert({required BuildContext context}) {
    return TestButton(
        onTap: () => bottomOneButtonAlert(
              context: context,
              title: "title",
              child: SizedBox(
                width: 219,
                child: Text(
                  "subTitle",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.text15.copyWith(
                    color: AppColors.grey13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              buttonLabel: "okLabel",
              onDone: () => {}, //Navigator.pop(context),
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return SizedBox.shrink();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getWidth(context),
        height: 300,
        color: Colors.amber,
        child: Center(
          child: Text(
            "Button For TEST",
            style: AppTextStyle.text24.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
