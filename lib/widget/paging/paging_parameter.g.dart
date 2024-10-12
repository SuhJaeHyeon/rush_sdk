// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagingParameterImpl _$$PagingParameterImplFromJson(
        Map<String, dynamic> json) =>
    _$PagingParameterImpl(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      brandId: (json['brandId'] as num?)?.toInt(),
      brandType: json['brandType'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$StoreTypeEnumMap, json['type']),
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      endAtOrder:
          $enumDecodeNullable(_$GraphQlOrderTypeEnumMap, json['endAtOrder']),
      order: (json['order'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      where: json['where'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PagingParameterImplToJson(
        _$PagingParameterImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'brandId': instance.brandId,
      'brandType': instance.brandType,
      'id': instance.id,
      'type': _$StoreTypeEnumMap[instance.type],
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'endAtOrder': _$GraphQlOrderTypeEnumMap[instance.endAtOrder],
      'order': instance.order,
      'where': instance.where,
    };

const _$StoreTypeEnumMap = {
  StoreType.fixed: 'fixed',
  StoreType.auction: 'auction',
};

const _$GraphQlOrderTypeEnumMap = {
  GraphQlOrderType.asc: 'asc',
  GraphQlOrderType.desc: 'desc',
  GraphQlOrderType.desc_nulls_last: 'desc_nulls_last',
};
