
import 'package:freezed_annotation/freezed_annotation.dart';

class StringSplitConverter implements JsonConverter<List<String>, String?> {
  final String delim;

  const StringSplitConverter(this.delim);

  @override
  List<String> fromJson(String? json) {
    if (json == null || json.isEmpty) return [];
    return json.split(delim);
  }

  @override
  String? toJson(List<String> object) => object.join(delim);
}
