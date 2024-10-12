import 'package:dartz/dartz.dart';
import 'package:epicone/core/widget/paging/paging_parameter.dart';
import 'package:epicone/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef PagingFetchFn<T> = Future<Either<Failure, List<T>>> Function(
    PagingParameter param);

/// > ## _페이징 컨트롤러_
///
/// 화면에서는 PagingWidget과 같이 사용하면 좋습니다.
///
/// 사용예제)
/// ```dart
/// class PagingControllerImpl extends GetxController
///     with PagingController<Model> {
///   PagingControllerImpl(this.param);
///   final FetchedStoreParameter param;
///
///   final _storeRepository = Get.find<StoreRepository>();
///
///   Future<void> fetch({bool? refresh}) async {
///     await paging(
///       fetchFn: _storeRepository.getStores,
///       parameter: param,
///       refresh: refresh,
///     );
///   }
/// }
/// ```
mixin PagingController<T> {
  /// ### 리스트를 완전히 새로고침할때의 로딩
  RxBool refreshing = false.obs;

  /// ### 다음 페이지를 불러올때의 로딩
  RxBool loadingMore = false.obs;

  /// ### 마지막 페이지까지 불러왔는지
  bool _isEnd = false;

  /// ### 페이징 결과
  final list = <T>[].obs;

  /// ### 페이지 당 [T]의 갯수, `override`하여 커스터마이징
  @protected
  int get limit => 20;

  /// ### [paging]을 호출하기 전에 실행
  @protected
  void pagingPrepare() {}

  /// ### [paging]을 호출하고 실행
  @protected
  void pagingFinally() {}

  @protected
  Future<void> paging({
    required PagingFetchFn<T> fetchFn,
    required PagingParameter parameter,
    bool? refresh,
    T Function(T element)? parserFn,
  }) async {
    refresh ??= false;
    parserFn ??= (e) => e;

    if (refresh) {
      _isEnd = false;
      list.clear();
    }

    if (refreshing.isTrue || loadingMore.isTrue || _isEnd) return;

    try {
      refresh ? refreshing.value = true : loadingMore.value = true;
      pagingPrepare();

      final either = await fetchFn(parameter.copyWith(
        offset: list.length,
        limit: limit,
      ));
      return either.fold(
        (l) => throw l,
        (r) {
          if (r.length < limit) {
            _isEnd = true;
          }
          list.addAll(r.map(parserFn!));
        },
      );
    } catch (e) {
      print(['PagingController Fetched error: ', e]);
    } finally {
      pagingFinally();
      loadingMore.value = false;
      refreshing.value = false;
    }
  }

  void setList(List<T> newList) => list.value = newList;
}
