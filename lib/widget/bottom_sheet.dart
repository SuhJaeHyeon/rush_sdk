import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/widget/svg.dart';

import '../util/size.dart';
import 'text/app_default_text_style.dart';

void customBottomSheet(
  BuildContext context, {
  double? height,
  bool isDismissible = true,
  required List<Widget> children,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AppDefaultTextStyle(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: getBottom(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void defaultBottomSheet({
  String? title,
  bool isBackbutton = false,
  double? height,
  bool enableDrag = true,
  required Widget body,
  required BuildContext context,
}) {
  isBackbutton ??= false;
  enableDrag ??= true;
  bool isScrollControlled = height == null ? false : true;

  showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isBackbutton) SizedBox(width: 50),
                    Container(
                      padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
                      child: Text(
                        title,
                        style: AppTextStyle.text18
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    if (isBackbutton)
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: SVGAsset(
                              'assets/icon/close_line.svg',
                              size: 24,
                              color: AppColors.grey08,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              Expanded(child: body),
            ],
          ),
        ),
      );
    },
  );
}