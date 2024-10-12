import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/client/response.dart';
import 'package:rush_sdk/util/logger.dart';
import 'package:rush_sdk/util/size.dart';
import 'package:rush_sdk/widget/alert.dart';
import 'package:rush_sdk/widget/lottie.dart';
import 'package:rush_sdk/widget/pop.dart';
import 'package:rush_sdk/widget/scaffold.dart';
import 'package:rush_sdk/widget/toast.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';

/// ## 로딩 컨트롤 끝! [LoadingWidget]!
///
/// - 로딩 변수 내장 [loading]
/// - 로딩에 값 대입하면 `setState`자동 호출
mixin LoadingWidget<T extends StatefulWidget> on State<T> {
  bool _loading = false;

  @protected
  bool get loading => _loading;

  @protected
  set loading(bool loading) {
    if (!mounted) return;
    setState(() {
      _loading = loading;
    });
  }

  /// ## 위젯이 마운트 되면 로딩처리가 필요한 [future]를 호출한다.
  @protected
  Future<void> fetchInit(Future Function() future) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      future();
    });
  }

  /// ## 위젯이 마운트 되면 [future]에 로딩처리 로직을 붙여 호출한다.
  @protected
  Future<void> fetchInitWithLoading(
    Future Function() future, {
    bool? alert,
  }) async {
    fetchInit(() => fetch(future, alert: alert));
  }

  /// ## [future] 실행 전후에 로딩 값을 변경한다.
  @protected
  Future<void> fetch(
    Future Function() future, {
    bool? alert,
    String? trasation,
    FutureOr<void> Function(HttpResponse response, bool? isRetry)?
        retryCallback,
    FutureOr<void> Function(HttpResponse response)? customAlert,
    Scope Function(Scope scope)? withScope,
    FutureOr<void> Function()? onFinally,
    FutureOr<void> Function(dynamic error)? onNetworkAlert,
  }) async {
    try {
      loading = true;
      await future();
    } on HttpResponse catch (e, t) {
      if (e.statusCode != '200') {
        await Sentry.captureException(
          e,
          stackTrace: t,
          withScope: (s) => (withScope ?? (s) => s)(s)..transaction = trasation,
        );

        print(e);
        if (alert ?? true) networkAlert();
        return;
      }

      if (e.message != null) {
        switch (e.message!.type) {
          case ResponseMessageType.toast:
            return errorToast(message: e.message!.title);
          case ResponseMessageType.alert:
            return await doneAlert(
              context: context,
              title: e.message!.title,
              onDone: () => Navigator.pop(context),
              content: e.message!.description == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        e.message!.description!,
                        style: AppTextStyle.text15.copyWith(
                          color: AppColors.grey13,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            );
          case ResponseMessageType.retry:
            return await retryCallback?.call(
              e,
              await retryAlert(
                title: e.message?.title,
                description: e.message?.description,
              ),
            );
          case ResponseMessageType.custom:
            return await customAlert?.call(e);
        }
      }
    } catch (e, t) {
      red(e);
      red(t);
      if (alert ?? true) onNetworkAlert?.call(e) ?? networkAlert();
      await Sentry.captureException(
        e,
        stackTrace: t,
        withScope: (s) => s..transaction = trasation,
      );
    } finally {
      onFinally?.call();
      if (mounted) loading = false;
    }
  }
}

class CustomLoading extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double size;

  const CustomLoading({
    Key? key,
    this.margin,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.primaryBlue),
      ),
    );
  }
}

/// ## 로딩중일 때 로딩 인디케이터를 화면 중앙에 올린다.
class CustomLoadingOverlay extends StatelessWidget {
  final double opacity;
  final bool loading;
  final Widget child;
  final bool canPop;

  /// ## 로딩중일 때 로딩 인디케이터를 화면 중앙에 올린다.
  const CustomLoadingOverlay({
    Key? key,
    this.opacity = 0.3,
    required this.loading,
    required this.child,
    this.canPop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pop(
      canPop: !loading,
      child: LoadingOverlay(
        opacity: opacity,
        isLoading: loading,
        color: AppColors.primaryBlack,
        progressIndicator: Lotties.main(),
        child: child,
      ),
    );
  }
}

/// ## 로딩중일 때 화면을 백지화 한다.
class CustomLoadingOverlayScaffold extends StatelessWidget {
  /// ## 로딩중일 때 화면을 백지화 한다.
  const CustomLoadingOverlayScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPermission(
      body: CustomLoadingOverlay(
        opacity: 0,
        loading: true,
        child: Container(),
      ),
    );
  }
}

class LinearPercentProgress extends StatelessWidget {
  const LinearPercentProgress(
    this.progress, {
    super.key,
    this.color,
  });

  final double? progress;
  final double height = 2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (progress == null) {
      return SizedBox(height: height);
    }

    var maxWidth = getWidth(context);
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: maxWidth * progress!,
        height: height,
        child: ColoredBox(color: color ?? AppColors.primaryBlue),
      ),
    );
  }
}
