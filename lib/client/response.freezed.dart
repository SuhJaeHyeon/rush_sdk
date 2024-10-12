// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HttpResponse _$HttpResponseFromJson(Map<String, dynamic> json) {
  return _HttpResponse.fromJson(json);
}

/// @nodoc
mixin _$HttpResponse {
  @JsonKey(name: 'result')
  bool get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  String get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  ResponseMessage? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HttpResponseCopyWith<HttpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResponseCopyWith<$Res> {
  factory $HttpResponseCopyWith(
          HttpResponse value, $Res Function(HttpResponse) then) =
      _$HttpResponseCopyWithImpl<$Res, HttpResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') bool result,
      @JsonKey(name: 'status_code') String statusCode,
      @JsonKey(name: 'data') Map<String, dynamic>? data,
      @JsonKey(name: 'message') ResponseMessage? message});

  $ResponseMessageCopyWith<$Res>? get message;
}

/// @nodoc
class _$HttpResponseCopyWithImpl<$Res, $Val extends HttpResponse>
    implements $HttpResponseCopyWith<$Res> {
  _$HttpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? statusCode = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ResponseMessage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseMessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $ResponseMessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HttpResponseImplCopyWith<$Res>
    implements $HttpResponseCopyWith<$Res> {
  factory _$$HttpResponseImplCopyWith(
          _$HttpResponseImpl value, $Res Function(_$HttpResponseImpl) then) =
      __$$HttpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') bool result,
      @JsonKey(name: 'status_code') String statusCode,
      @JsonKey(name: 'data') Map<String, dynamic>? data,
      @JsonKey(name: 'message') ResponseMessage? message});

  @override
  $ResponseMessageCopyWith<$Res>? get message;
}

/// @nodoc
class __$$HttpResponseImplCopyWithImpl<$Res>
    extends _$HttpResponseCopyWithImpl<$Res, _$HttpResponseImpl>
    implements _$$HttpResponseImplCopyWith<$Res> {
  __$$HttpResponseImplCopyWithImpl(
      _$HttpResponseImpl _value, $Res Function(_$HttpResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? statusCode = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$HttpResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ResponseMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HttpResponseImpl extends _HttpResponse {
  _$HttpResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'status_code') required this.statusCode,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'message') this.message})
      : super._();

  factory _$HttpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HttpResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final bool result;
  @override
  @JsonKey(name: 'status_code')
  final String statusCode;
  @override
  @JsonKey(name: 'data')
  final Map<String, dynamic>? data;
  @override
  @JsonKey(name: 'message')
  final ResponseMessage? message;

  @override
  String toString() {
    return 'HttpResponse(result: $result, statusCode: $statusCode, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, statusCode,
      const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpResponseImplCopyWith<_$HttpResponseImpl> get copyWith =>
      __$$HttpResponseImplCopyWithImpl<_$HttpResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HttpResponseImplToJson(
      this,
    );
  }
}

abstract class _HttpResponse extends HttpResponse {
  factory _HttpResponse(
          {@JsonKey(name: 'result') required final bool result,
          @JsonKey(name: 'status_code') required final String statusCode,
          @JsonKey(name: 'data') final Map<String, dynamic>? data,
          @JsonKey(name: 'message') final ResponseMessage? message}) =
      _$HttpResponseImpl;
  _HttpResponse._() : super._();

  factory _HttpResponse.fromJson(Map<String, dynamic> json) =
      _$HttpResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  bool get result;
  @override
  @JsonKey(name: 'status_code')
  String get statusCode;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data;
  @override
  @JsonKey(name: 'message')
  ResponseMessage? get message;
  @override
  @JsonKey(ignore: true)
  _$$HttpResponseImplCopyWith<_$HttpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseMessage _$ResponseMessageFromJson(Map<String, dynamic> json) {
  return _ResponseMessage.fromJson(json);
}

/// @nodoc
mixin _$ResponseMessage {
  @JsonEnum()
  @JsonKey(name: 'type')
  ResponseMessageType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseMessageCopyWith<ResponseMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseMessageCopyWith<$Res> {
  factory $ResponseMessageCopyWith(
          ResponseMessage value, $Res Function(ResponseMessage) then) =
      _$ResponseMessageCopyWithImpl<$Res, ResponseMessage>;
  @useResult
  $Res call(
      {@JsonEnum() @JsonKey(name: 'type') ResponseMessageType type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$ResponseMessageCopyWithImpl<$Res, $Val extends ResponseMessage>
    implements $ResponseMessageCopyWith<$Res> {
  _$ResponseMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseMessageType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseMessageImplCopyWith<$Res>
    implements $ResponseMessageCopyWith<$Res> {
  factory _$$ResponseMessageImplCopyWith(_$ResponseMessageImpl value,
          $Res Function(_$ResponseMessageImpl) then) =
      __$$ResponseMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonEnum() @JsonKey(name: 'type') ResponseMessageType type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$ResponseMessageImplCopyWithImpl<$Res>
    extends _$ResponseMessageCopyWithImpl<$Res, _$ResponseMessageImpl>
    implements _$$ResponseMessageImplCopyWith<$Res> {
  __$$ResponseMessageImplCopyWithImpl(
      _$ResponseMessageImpl _value, $Res Function(_$ResponseMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = freezed,
  }) {
    return _then(_$ResponseMessageImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseMessageType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseMessageImpl implements _ResponseMessage {
  _$ResponseMessageImpl(
      {@JsonEnum() @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') this.description});

  factory _$ResponseMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseMessageImplFromJson(json);

  @override
  @JsonEnum()
  @JsonKey(name: 'type')
  final ResponseMessageType type;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'ResponseMessage(type: $type, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseMessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseMessageImplCopyWith<_$ResponseMessageImpl> get copyWith =>
      __$$ResponseMessageImplCopyWithImpl<_$ResponseMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseMessageImplToJson(
      this,
    );
  }
}

abstract class _ResponseMessage implements ResponseMessage {
  factory _ResponseMessage(
          {@JsonEnum()
          @JsonKey(name: 'type')
          required final ResponseMessageType type,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') final String? description}) =
      _$ResponseMessageImpl;

  factory _ResponseMessage.fromJson(Map<String, dynamic> json) =
      _$ResponseMessageImpl.fromJson;

  @override
  @JsonEnum()
  @JsonKey(name: 'type')
  ResponseMessageType get type;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ResponseMessageImplCopyWith<_$ResponseMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
