import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class HttpResponse with _$HttpResponse {
  const HttpResponse._();
  factory HttpResponse({
    @JsonKey(name: 'result') required bool result,
    @JsonKey(name: 'status_code') required String statusCode,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
    @JsonKey(name: 'message') ResponseMessage? message,
  }) = _HttpResponse;

  factory HttpResponse.fromJson(Map<String, dynamic> json) =>
      _$HttpResponseFromJson(json);

  T? parse<T>(T Function(Map<String, dynamic> data) fromJson) =>
      data == null ? null : fromJson(data!);

  List<T> parseList<T>(
    T Function(Map<String, dynamic> data) fromJson, [
    String? alias,
  ]) =>
      data == null
          ? []
          : List<Map<String, dynamic>>.from(data![alias ?? 'items'])
              .map((e) => fromJson(e))
              .toList();
}

@freezed
class ResponseMessage with _$ResponseMessage {
  factory ResponseMessage({
    @JsonEnum() @JsonKey(name: 'type') required ResponseMessageType type,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') String? description,
  }) = _ResponseMessage;

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageFromJson(json);
}

enum ResponseMessageType {
  toast,
  alert,
  retry,
  custom;
}
