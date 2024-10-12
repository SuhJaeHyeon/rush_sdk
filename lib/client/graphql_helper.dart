// ignore_for_file: depend_on_referenced_packages

// import 'package:dartz/dartz.dart';
// import 'package:epicone/core/client/client_graphql.dart';
// import 'package:epicone/core/client/graphql_stream.dart';
// import 'package:epicone/core/error/failures.dart';
// import 'package:epicone/core/firebase/firebase.dart';
// import 'package:epicone/core/util/enum.dart';
import 'package:graphql/client.dart';
import 'package:gql/ast.dart';

extension DocumentNodeExtension on DocumentNode {
  /// ## [issue: how to add fragments ???](https://github.com/zino-hofmann/graphql-flutter/issues/113#issuecomment-817739768)
  DocumentNode addFragments(List<DocumentNode> fragments) {
    final newDefinitions = Set<DefinitionNode>.from(definitions);
    for (final frag in fragments) {
      newDefinitions.addAll(frag.definitions);
    }
    return DocumentNode(definitions: newDefinitions.toList(), span: span);
  }
}

class GraphQLHelper {
  static T? readCache<T>({
    required GraphQLClient client,
    required Request request,
    required String key,
  }) {
    var data = client.readQuery(request);
    if (data == null) return null;

    if (T is List) {
      return List.from(data[key]) as T;
    } else if (T is Map) {
      return Map.from(data[key]) as T;
    } else {
      return data[key];
    }
  }

  static void writeCache({
    required GraphQLClient client,
    required Request request,
    required String key,
    required dynamic data,
  }) {
    return client.writeQuery(
      request,
      data: {
        "__typename": "query_root",
        key: data,
      },
    );
  }

  static String getWebsocketUrl(String graphqlUrl) =>
      Uri.parse(graphqlUrl).replace(scheme: "wss").toString();
}

extension QueryResultExtension on QueryResult {
  List<T> parse<T>(
    T Function(Map<String, Object?> json) fromJson, {
    String? alias,
  }) =>
      data == null
          ? []
          : (data![alias ?? 'items'] as List).map((e) => fromJson(e)).toList();

  T? parseOne<T>(
    T Function(Map<String, Object?> json) fromJson, {
    String? alias,
  }) =>
      parse(fromJson, alias: alias).firstOrNull;

  List<T> parseMutationResult<T>(
    T Function(Map<String, Object?> json) fromJson,
    String alias,
  ) {
    return (data![alias]["returning"] as List).map((e) => fromJson(e)).toList();
  }

  T? parseMutationResultOne<T>(
    T Function(Map<String, Object?> json) fromJson,
    String alias,
  ) =>
      parseMutationResult(fromJson, alias).firstOrNull;
}
