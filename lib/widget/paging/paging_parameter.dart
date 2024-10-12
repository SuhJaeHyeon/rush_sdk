import 'package:epicone/core/util/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_parameter.freezed.dart';
part 'paging_parameter.g.dart';

@freezed
class PagingParameter with _$PagingParameter {
  factory PagingParameter({
    int? limit,
    int? offset,
    int? brandId,
    String? brandType,
    int? id,
    StoreType? type,
    DateTime? startAt,
    DateTime? endAt,
    GraphQlOrderType? endAtOrder,
    List<Map<String, String>>? order,
    Map<String, dynamic>? where,
  }) = _PagingParameter;

  factory PagingParameter.fromJson(Map<String, dynamic> json) =>
      _$PagingParameterFromJson(json);
}
