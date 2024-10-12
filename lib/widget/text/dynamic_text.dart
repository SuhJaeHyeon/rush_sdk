import 'package:epicone/router/goto_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dynamic_text.freezed.dart';
part 'dynamic_text.g.dart';

@freezed
class DynamicText with _$DynamicText {
  const DynamicText._();

  factory DynamicText({
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: "color") String? color,
    @JsonKey(name: "font_size") int? fontSize,
    @JsonKey(name: "font_weight") int? fontWeight,
    @JsonKey(name: "line_height") double? lineHeight,
    @JsonKey(name: "decoration") String? decoration,
    @JsonKey(name: "goto") Goto? goto,
  }) = _DynamicText;

  factory DynamicText.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFromJson(json);
}
