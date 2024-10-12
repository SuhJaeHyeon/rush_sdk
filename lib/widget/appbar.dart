import 'dart:ui';

import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  final Widget? titleWidget;
  final double elevation;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final bool? automaticallyImplyLeading;

  CustomAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.elevation = 0,
    this.actions,
    this.leading,
    this.backgroundColor = Colors.white,
    this.systemOverlayStyle,
    this.bottom,
    this.flexibleSpace,
    this.automaticallyImplyLeading,
    double? preferredSize,
  })  : preferredSize = Size.fromHeight(preferredSize ?? 56.0),
        super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: titleWidget ??
          Text(
            // 아래 특수문자 제거하지 말것!!!
            title?.replaceAll(" ", " ") ?? '',
            style: AppTextStyle.text18.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlack,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
      bottom: bottom,
      flexibleSpace: flexibleSpace,
      systemOverlayStyle: systemOverlayStyle,
      // centerTitle: true,
      leading: leading,
      actions: actions?.isNotEmpty == true ? actions : [SizedBox(width: 50)],
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  const AppBarBackButton({
    Key? key,
    this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap == null) {
          Navigator.pop(context);
        } else {
          onTap!();
        }
      },
      child: Container(
        color: Colors.transparent,
        // padding: const EdgeInsets.only(left: 15),
        child: Center(
          child: SvgPicture.asset(
            'assets/icon/line_arrow_left.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Function? onTap;

  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          if (onTap == null) {
            // Get.back();
          } else {
            onTap!();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: SvgPicture.asset(
            'assets/icon/line_arrow_left.svg',
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  final Function? onTap;

  const CustomCloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          if (onTap == null) {
            // Get.back();
          } else {
            onTap!();
          }
        },
        child: SvgPicture.asset('assets/icon/close_line.svg'),
      ),
    );
  }
}

class GlassMorphismAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const GlassMorphismAppBar({
    super.key,
    required this.appbar,
  });

  final PreferredSizeWidget appbar;

  @override
  Size get preferredSize => appbar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: appbar.preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: appbar,
        ),
      ),
    );
  }
}
