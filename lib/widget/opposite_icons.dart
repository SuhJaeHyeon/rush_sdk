import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/widget/svg.dart';
import 'package:flutter/material.dart';

/// ## 자주쓰는 On/Off 아이콘 모음
class OppositeIcons extends StatelessWidget {
  const OppositeIcons({
    super.key,
    required this.on,
    this.off,
    required this.isOn,
    this.width,
    this.height,
    this.color,
    this.offWidget,
  });

  final String on;
  final String? off;
  final bool isOn;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? offWidget;

  factory OppositeIcons.arrowUpDown(bool isOn, {Color? color, double? width, double? height}) => OppositeIcons(
        on: "assets/icon/arrow_up.svg",
        off: "assets/icon/dropdown_arrow.svg",
        isOn: isOn,
        width: width,
        height: height,
        color: color,
      );

  factory OppositeIcons.radioOnOff(bool isOn, {double? size}) => OppositeIcons(
        on: "assets/icon/radio_on.svg",
        off: "assets/icon/radio_off.svg",
        isOn: isOn,
        width: size,
        height: size,
      );

  factory OppositeIcons.openeyesFill(bool isOn) => OppositeIcons(
        on: 'assets/icon/openeyes_off_fill.svg',
        off: 'assets/icon/openeyes_fill.svg',
        isOn: isOn,
      );

  factory OppositeIcons.checkRoundBox(bool isOn, {double size = 24}) => OppositeIcons(
        on: "assets/icon/checkbox_on.svg",
        off: "assets/icon/checkbox_off.svg",
        isOn: isOn,
        width: size,
        height: size,
      );

  factory OppositeIcons.scrap(bool isOn) => OppositeIcons(
        on: "assets/icon/scrap_on.svg",
        off: "assets/icon/scrap_off.svg",
        isOn: isOn,
        width: 24,
        height: 24,
      );

  factory OppositeIcons.check(bool isOn) => OppositeIcons(
        on: "assets/icon/check.svg",
        offWidget: SVGAsset(
          "assets/icon/check.svg",
          color: AppColors.grey06,
          width: 20,
          height: 20,
        ),
        isOn: isOn,
        width: 20,
        height: 20,
      );

  dynamic _getIcon(bool isOn) => isOn ? on : (off ?? offWidget);

  @override
  Widget build(BuildContext context) {
    var icon = _getIcon(isOn);
    if (icon is Widget) {
      return icon;
    } else {
      if (on.endsWith("svg")) {
        return SVGAsset(
          icon,
          width: width,
          height: height,
          color: color,
        );
      } else {
        return Image.asset(
          icon,
          width: width,
          height: height,
          color: color,
        );
      }
    }
  }
}
