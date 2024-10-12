// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HttpResponseImpl _$$HttpResponseImplFromJson(Map<String, dynamic> json) =>
    _$HttpResponseImpl(
      result: json['result'] as bool,
      statusCode: json['status_code'] as String,
      data: json['data'] as Map<String, dynamic>?,
      message: json['message'] == null
          ? null
          : ResponseMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HttpResponseImplToJson(_$HttpResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'status_code': instance.statusCode,
      'data': instance.data,
      'message': instance.message?.toJson(),
    };

_$ResponseMessageImpl _$$ResponseMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseMessageImpl(
      type: $enumDecode(_$ResponseMessageTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ResponseMessageImplToJson(
        _$ResponseMessageImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseMessageTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
    };

const _$ResponseMessageTypeEnumMap = {
  ResponseMessageType.toast: 'toast',
  ResponseMessageType.alert: 'alert',
  ResponseMessageType.retry: 'retry',
  ResponseMessageType.custom: 'custom',
};
