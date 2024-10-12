import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/util/string.dart';
import 'package:rush_sdk/widget/text/dynamic_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class DynamicTextBuilder extends StatelessWidget {
  const DynamicTextBuilder(
    this.texts, {
    super.key,
    this.textAlign,
  });

  final List<DynamicText> texts;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: texts
            .map((e) => TextSpan(
                  text: e.text,
                  style: AppTextStyle.getStyle(e.fontSize ?? 14).copyWith(
                      color: (e.color ?? "#000000").toColor(),
                      fontWeight: AppTextStyle.getWeight(e.fontWeight ?? 400),
                      height: e.lineHeight,
                      decoration: switch (e.decoration) {
                        "underline" => TextDecoration.underline,
                        "overline" => TextDecoration.overline,
                        "linethrough" => TextDecoration.lineThrough,
                        _ => null,
                      }),
                  recognizer: e.goto != null
                      ? (TapGestureRecognizer()
                        ..onTap = () {
                          // GotoPath.shared.fromGoto(e.goto);
                        })
                      : null,
                ))
            .toList(),
      ),
      textAlign: textAlign,
    );
  }
}
