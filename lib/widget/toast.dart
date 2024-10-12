import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast({
  required BuildContext context,
  String? title,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.primaryBlack.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 20, right: 16, left: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

void successToast({
  required BuildContext context,
  String? title,
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.primaryBlack.withOpacity(0.8),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


void warningToast({
  String? title,
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.primaryBlack.withOpacity(0.8), // 경고 색상으로 변경
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void errorToast({
  String? title,
  String message = '네트워크 오류가 발생했습니다',
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.error.withOpacity(0.8), // 오류 색상으로 변경
    textColor: Colors.white,
    fontSize: 16.0,
  );
}