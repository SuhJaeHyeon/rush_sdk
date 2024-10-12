import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      decoration: BoxDecoration(
        color: color ?? AppColors.grey04,
      ),
    );
  }
}
