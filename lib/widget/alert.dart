import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/widget/text/dynamic_text.dart';
import 'package:rush_sdk/widget/text/dynamic_text_builder.dart';

import 'button.dart';
import 'package:flutter/material.dart';

Future<T?> customAlert<T>({
  required BuildContext context,
  required String title,
  required Function doneTap,
  Widget? content,
  String cancelText = '취소',
  String doneText = '확인',
}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.text18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  content ?? Container(),
                  content != null ? SizedBox(height: 30) : SizedBox(height: 15),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: AppColors.grey06,
                        ),
                      ),
                    ),
                    child: CustomElevatedButton(
                      textColor: AppColors.grey13,
                      color: AppColors.white,
                      onPressed: () => Navigator.of(context).pop(),
                      text: cancelText,
                      borderRadius: 0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: AppColors.primaryBlack,
                        ),
                      ),
                    ),
                    child: CustomElevatedButton(
                      onPressed: () {
                        doneTap();
                        Navigator.of(context).pop();
                      },
                      text: doneText,
                      borderRadius: 0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}


Future<T?> agreeAlert<T>({
  required BuildContext context,
  required String title,
  required Function onDone,
  Widget? content,
}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: AppTextStyle.text18.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        titlePadding: EdgeInsets.only(left: 26, right: 26, top: 40, bottom: 10),
        contentPadding: EdgeInsets.only(top: 9, bottom: 0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 26, right: 26, bottom: 40),
              child: content ?? Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.grey06))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        child: Center(
                          child: Text(
                            '취소',
                            style: AppTextStyle.text15.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.grey06,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onDone();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icon/check.svg',
                              width: 17,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '동의',
                              style: AppTextStyle.text15.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<void> doneAlert({
  required BuildContext context,
  required String title,
  required Function onDone,
  Widget? content,
}) async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.text18.copyWith(fontWeight: FontWeight.w600),
        ),
        titlePadding: EdgeInsets.only(left: 26, right: 26, top: 40, bottom: 10),
        contentPadding: EdgeInsets.only(top: 9, bottom: 0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 26, right: 26, bottom: 40),
              child: content ?? Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.grey06))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onDone();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        child: Text(
                          '확인',
                          style: AppTextStyle.text15.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<bool?> defaultAlert({
  required BuildContext context,
  required String title,
  required Function onDone,
  String doneText = '확인',
  String cancelText = '취소',
  Widget? content,
  List<DynamicText>? dynamicTitle,
}) async {
  return await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: dynamicTitle != null
          ? DynamicTextBuilder(
              dynamicTitle,
              textAlign: TextAlign.center,
            )
          : Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.text18.copyWith(fontWeight: FontWeight.w600),
            ),
      titlePadding: EdgeInsets.only(left: 26, right: 26, top: 40, bottom: 10),
      contentPadding: EdgeInsets.only(top: 9, bottom: 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 26, right: 26, bottom: 40),
            child: content ?? Container(),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.grey06))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      child: Center(
                        child: Text(
                          cancelText,
                          style: AppTextStyle.text15.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 48,
                  color: AppColors.grey06,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onDone();
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      child: Text(
                        doneText,
                        style: AppTextStyle.text15.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
});
}

Future<void> networkAlert(
  BuildContext context, {
  String? message,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
        '일시적인 오류가 발생했습니다.',
        textAlign: TextAlign.center,
        style: AppTextStyle.text18,
      ),
      titlePadding: EdgeInsets.only(left: 19, right: 19, top: 35, bottom: 0),
      contentPadding: EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 35),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              message ?? '재시도 후에도 문제가 발생하는 경우\n고객센터로 연락해주시면 빠르게 도와드리겠습니다.',
              textAlign: TextAlign.center,
              style: AppTextStyle.text14.copyWith(
                color: AppColors.grey13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // 고객센터로 이동
            },
            child: Text(
              '고객센터 문의하기',
              style: AppTextStyle.text13.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomElevatedButton(
                  padding: EdgeInsets.all(14),
                  textColor: AppColors.white,
                  color: AppColors.primaryBlack,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  borderRadius: 4,
                  text: '확인',
                ),
              ),
            ],
          ),
        ],
      ),
      actionsPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
});
}

Future<T?> bottomOneButtonAlert<T>({
  required BuildContext context,
  required String? title,
  required Widget? child,
  String? description,
  required String buttonLabel,
  Color? buttonColor,
  required void Function() onDone,
  bool? isDismissible,
  Widget? customButton,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
      title: title == null
          ? null
          : Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.text18,
            ),
      titlePadding: EdgeInsets.only(left: 19, right: 19, top: 35, bottom: 0),
      contentPadding: EdgeInsets.only(top: 9, bottom: 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (child != null) child,
          if (description != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    description,
                    style: AppTextStyle.text15.copyWith(
                      color: AppColors.grey13,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          SizedBox(height: 30),
          customButton ??
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomElevatedButton(
                      padding: EdgeInsets.all(14),
                      textColor: AppColors.white,
                      color: buttonColor ?? AppColors.primaryBlack,
                      onPressed: onDone,
                      borderRadius: 0,
                      text: buttonLabel,
                    ),
                  ),
                ],
              ),
        ],
      ),
      actionsPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
    }
  );
}

Future<void> duplicatedEmailAlert(
  BuildContext context, {
  required String title,
  required String description,
  required String hint,}
) async {
  return await bottomOneButtonAlert(
    context: context,
    title: title,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          Text(
            description,
            style: AppTextStyle.text15.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            hint,
            style: AppTextStyle.text14.copyWith(
              color: AppColors.grey13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    buttonLabel: '확인',
    onDone: () {
      Navigator.of(context).pop();
    },
  );
}

Future<void> onlyTitleOnebuttonAlert(
  BuildContext context, {
  required String title,
}) async {
  return await bottomOneButtonAlert(
    context: context,
    title: title,
    child: SizedBox.shrink(),
    buttonLabel: "확인",
    onDone: () {
      Navigator.of(context).pop();
    },
  );
}

Future<void> blueAgreeAlert({
  required BuildContext context,
  required String title,
  List<Widget>? contents,
  String? doneText,
  String? cancelText,
  required Function onDone,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
      titlePadding: EdgeInsets.only(top: 40),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.text18.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...contents ?? [],
        ],
      ),
      contentPadding: EdgeInsets.fromLTRB(19.5, 10, 19.5, 30),
      actionsPadding: EdgeInsets.zero,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.grey06,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    cancelText ?? "취소",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.text15.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                onDone();
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Text(
                  doneText ?? "확인",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.text15.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
});
}
