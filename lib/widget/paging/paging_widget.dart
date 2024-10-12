import 'package:flutter/material.dart';

/// > ## _페이징 위젯_
///
/// 1. 페이징을 적용할 `StatefulWidet`에 믹스인을 붙입니다.
/// 2. [pagingScrollController]를 `ListView` 또는 `SingleChildScrollView`에 파라미터로 넘겨줍니다.
/// 3. [onPageEnd]는 스크롤이 페이지의 최하단에 위치했을 때 호출됩니다. [onPageEnd]를 구현합니다.
mixin PagingWidget<T extends StatefulWidget> on State<T> {
  @protected
  late final ScrollController pagingScrollController = ScrollController()
    ..addListener(() {
      if (pagingScrollController.offset >=
          pagingScrollController.position.maxScrollExtent) {
        onPageEnd();
      }
    });

  @override
  void dispose() {
    pagingScrollController.dispose();
    super.dispose();
  }

  /// ### 스크롤이 최하단일 때 호출하는 메서드
  @protected
  Future<void> Function() get onPageEnd;
}
