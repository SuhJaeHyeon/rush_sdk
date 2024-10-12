import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/util/size.dart';


class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Widget? textWidget;
  final double borderRadius;
  final EdgeInsets? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;
  final double? textSize;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textWidget,
    this.borderRadius = 100,
    this.padding,
    this.color,
    this.disabledColor,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(padding ?? EdgeInsets.all(18)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: textColor != null ? BorderSide(color: textColor!) : BorderSide.none,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return color ?? AppColors.primaryBlack;
            } else if (states.contains(MaterialState.disabled)) {
              return disabledColor ?? AppColors.grey07;
            } else {
              return color ?? AppColors.primaryBlack;
            }
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            return BorderSide(
              color: textColor ?? Colors.transparent,
              width: 2.0,
            );
          },
        ),
      ),
      child: textWidget ??
          Text(
            text,
            style: TextStyle(
              fontSize: textSize ?? 16,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.white,
              height: 1.2,
            ),
          ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final EdgeInsets? padding;
  final String text;
  final double? textSize;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final Widget? suffixIcon;
  final Color? disabledColor;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.padding,
    this.borderRadius = 10,
    this.color,
    this.textColor,
    this.borderColor,
    this.textSize,
    this.suffixIcon,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        padding: MaterialStateProperty.all(padding ?? EdgeInsets.all(18)),
        overlayColor: MaterialStateProperty.all(AppColors.primaryBlack.withOpacity(0.1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: AppColors.error),
          ),
        ),
        side: MaterialStateProperty.all(BorderSide(color: borderColor ?? AppColors.primaryBlack)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return color ?? Colors.transparent;
            } else if (states.contains(MaterialState.disabled)) {
              return disabledColor ?? Color(0xffD0D4D9);
            } else {
              return color ?? Colors.transparent;
            }
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: textColor ?? AppColors.primaryBlack, fontSize: textSize ?? 16, height: 1.2, fontWeight: FontWeight.w500),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}

class OnTapScaleAndFade extends StatefulWidget {
  final Widget child;
  final void Function() onTap;
  const OnTapScaleAndFade({Key? key, required this.child, required this.onTap}) : super(key: key);

  @override
  _OnTapScaleAndFadeState createState() => _OnTapScaleAndFadeState();
}

class _OnTapScaleAndFadeState extends State<OnTapScaleAndFade> with TickerProviderStateMixin {
  double squareScaleA = 1;
  AnimationController? _controllerA;
  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1,
      value: 1,
      duration: Duration(milliseconds: 100),
    );
    _controllerA!.addListener(() {
      if (mounted) {
        setState(() {
          squareScaleA = _controllerA!.value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (mounted) {
          _controllerA!.reverse();
        }

        widget.onTap();
      },
      onTapDown: (dp) {
        if (mounted) {
          _controllerA!.reverse();
        }
      },
      onTapUp: (dp) {
        if (mounted) {
          Timer(Duration(milliseconds: 100), () {
            _controllerA!.fling();
          });
        }
      },
      onTapCancel: () {
        if (mounted) {
          _controllerA!.fling();
        }
      },
      child: Transform.scale(
        scale: squareScaleA,
        child: widget.child,
      ),
    );
  }
}

class FadeButton extends StatefulWidget {
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Widget child;

  const FadeButton({
    super.key,
    this.onTap,
    this.margin,
    this.padding,
    this.color = Colors.transparent,
    required this.child,
  });

  @override
  State<FadeButton> createState() => _FadeButtonState();
}

class _FadeButtonState extends State<FadeButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Tween<double> _tween = Tween<double>(begin: 1.0);
  bool _isButton = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: Duration(milliseconds: 200),
    );
    _animation = _animationController
        .drive(
          CurveTween(
            curve: Curves.decelerate,
          ),
        )
        .drive(_tween);

    _setTween();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeButton old) {
    _setTween();
    super.didUpdateWidget(old);
  }

  void _setTween() {
    _tween.begin = 1.0;
    _tween.end = 0.4;
  }

  void _onTapUp(_) {
    if (widget.onTap != null) {
      if (_isButton) {
        _isButton = false;

        _animate();
      }
    }
  }

  void _onTapDown(_) {
    if (widget.onTap != null) {
      if (!_isButton) {
        _isButton = true;

        _animate();
      }
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      if (_isButton) {
        _isButton = false;

        _animate();
      }
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;

    final bool isWasButton = _isButton;
    final TickerFuture tickerFuture = _isButton
        ? _animationController.animateTo(
            1,
            duration: Duration(milliseconds: 10),
          )
        : _animationController.animateTo(
            0,
            duration: Duration(milliseconds: 100),
          );

    tickerFuture.then((_) {
      if (mounted && isWasButton != _isButton) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: widget.margin,
          color: widget.color,
          child: GestureDetector(
            onTap: widget.onTap,
            onTapUp: _onTapUp,
            onTapDown: _onTapDown,
            onTapCancel: _onTapCancel,
            behavior: HitTestBehavior.opaque,
            child: FadeTransition(
              opacity: _animation,
              child: Container(
                padding: widget.padding ?? EdgeInsets.all(10),
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomGesutureBox extends StatelessWidget {
  const CustomGesutureBox({
    super.key,
    this.enabled = true,
    required this.text,
    this.style,
    this.disabledStyle,
    this.decoration,
    this.disabledDecoration,
    this.onTap,
    this.width,
    this.height,
  });

  final bool? enabled;
  final String text;
  final TextStyle? style;
  final TextStyle Function(TextStyle activeStyle)? disabledStyle;
  final BoxDecoration? decoration;
  final BoxDecoration Function(BoxDecoration activeDecoration)? disabledDecoration;
  final void Function()? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled! ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: enabled! ? decoration : disabledDecoration?.call(decoration!),
        child: Center(
          child: Text(
            text,
            style: enabled! ? style : disabledStyle?.call(style!),
          ),
        ),
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.grey04,
            width: 1,
          ),
        ),
      ),
      child: SizedBox(
        width: getWidth(context),
        child: CustomElevatedButton(
          text: label,
          onPressed: onTap,
        ),
      ),
    );
  }
}
