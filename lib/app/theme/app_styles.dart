import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle get text08 =>
      const TextStyle(fontSize: 8, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text09 =>
      const TextStyle(fontSize: 9, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text10 =>
      const TextStyle(fontSize: 10, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text11 =>
      const TextStyle(fontSize: 11.5, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text11_5 =>
      const TextStyle(fontSize: 11, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text12 =>
      const TextStyle(fontSize: 12, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text13 =>
      const TextStyle(fontSize: 13, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text13_5 =>
      const TextStyle(fontSize: 13.5, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text14 =>
      const TextStyle(fontSize: 14, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text15 =>
      const TextStyle(fontSize: 15, height: 1.3, color: AppColors.primaryBlack);
  static TextStyle get text16 =>
      const TextStyle(fontSize: 16, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text17 =>
      const TextStyle(fontSize: 17, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text18 =>
      const TextStyle(fontSize: 18, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text20 =>
      const TextStyle(fontSize: 20, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text21 =>
      const TextStyle(fontSize: 21, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text22 =>
      const TextStyle(fontSize: 22, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text24 =>
      const TextStyle(fontSize: 24, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text26 =>
      const TextStyle(fontSize: 26, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text28 =>
      const TextStyle(fontSize: 28, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text32 =>
      const TextStyle(fontSize: 32, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text34 =>
      const TextStyle(fontSize: 34, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text36 =>
      const TextStyle(fontSize: 36, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text38 =>
      const TextStyle(fontSize: 38, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text40 =>
      const TextStyle(fontSize: 40, height: 1.5, color: AppColors.primaryBlack);
  static TextStyle get text45 =>
      const TextStyle(fontSize: 45, height: 1.5, color: AppColors.primaryBlack);

  static TextStyle getStyle(int size) {
    switch (size) {
      case 8:
        return text08;
      case 9:
        return text09;
      case 10:
        return text10;
      case 11:
        return text11;
      case 12:
        return text12;
      case 13:
        return text13;
      case 14:
        return text14;
      case 15:
        return text15;
      case 16:
        return text16;
      case 17:
        return text17;
      case 18:
        return text18;
      case 20:
        return text20;
      case 21:
        return text21;
      case 22:
        return text22;
      case 24:
        return text24;
      case 26:
        return text26;
      case 28:
        return text28;
      case 32:
        return text32;
      case 34:
        return text34;
      case 36:
        return text36;
      case 38:
        return text38;
      case 40:
        return text40;
      case 45:
        return text45;
      default:
        return TextStyle(
          fontSize: size.toDouble(),
          height: 1.5,
          color: AppColors.primaryBlack,
        );
    }
  }

  static FontWeight getWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }
}
