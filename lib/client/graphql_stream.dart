import 'dart:async';

import 'package:graphql/client.dart';

class GraphQLStream<T> {
  final GraphQLClient client;
  final Stream<QueryResult<List<T>>> stream;
  final List<StreamSubscription<QueryResult<List<T>>>> subscriptions = [];

  GraphQLStream(this.client, this.stream);

  listen(void Function(QueryResult<List<T>>) onData) {
    subscriptions.add(stream.listen(onData, cancelOnError: true));
  }

  dispose() {
    for (var element in subscriptions) {
      element.cancel();
    }
    client.link.dispose();
  }
}
