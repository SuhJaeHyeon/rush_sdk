import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';

class TabBarEpicTheme extends StatelessWidget {
  const TabBarEpicTheme({
    super.key,
    required this.controller,
    required this.tabDefaults,
    this.marginTop,
    this.unselectedLabelColor,
  });

  final TabController controller;
  final List<String> tabDefaults;
  final double? marginTop;
  final Color? unselectedLabelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop ?? 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey04),
        ),
      ),
      child: TabBar(
        labelStyle: AppTextStyle.text18.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTextStyle.text18.copyWith(
          fontWeight: FontWeight.w500,
        ),
        labelColor: AppColors.primaryBlack,
        unselectedLabelColor: unselectedLabelColor ?? AppColors.grey07,
        indicatorColor: AppColors.primaryBlack,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        tabs: tabDefaults
            .map(
              (e) => Tab(
                height: 40,
                child: Text(
                  e,
                  strutStyle: StrutStyle(
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
              ),
            )
            .toList(),
        controller: controller,
      ),
    );
  }
}

class TabBarEpicThemeStorePage extends StatelessWidget {
  const TabBarEpicThemeStorePage({
    super.key,
    required this.controller,
    required this.tabDefaults,
    this.marginTop,
    this.unselectedLabelColor,
  });

  final TabController controller;
  final List<String> tabDefaults;
  final double? marginTop;
  final Color? unselectedLabelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop ?? 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey04),
        ),
      ),
      child: TabBar(
        labelStyle: Platform.isAndroid
            ? AppTextStyle.text14.copyWith(
                fontWeight: FontWeight.w600,
              )
            : AppTextStyle.text15.copyWith(
                fontWeight: FontWeight.w600,
              ),
        unselectedLabelStyle: Platform.isAndroid
            ? AppTextStyle.text14.copyWith(
                fontWeight: FontWeight.w400,
              )
            : AppTextStyle.text15.copyWith(
                fontWeight: FontWeight.w500,
              ),
        labelColor: AppColors.primaryBlack,
        unselectedLabelColor: unselectedLabelColor ?? AppColors.grey07,
        indicatorColor: AppColors.primaryBlack,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(horizontal: 12),
        tabs: tabDefaults
            .map(
              (e) => Tab(
                height: 40,
                child: Text(
                  e,
                  strutStyle: StrutStyle(
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
              ),
            )
            .toList(),
        controller: controller,
      ),
    );
  }
}
