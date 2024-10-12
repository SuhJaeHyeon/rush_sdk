import 'package:rush_sdk/client/interceptor_graphql.dart';
import 'package:rush_sdk/app/firebase/firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:sentry_link/sentry_link.dart';

class AuthWebSocketLink extends Link {
  AuthWebSocketLink(this.url);
  final String url;
  _Connection? _connection;

  /// this will be called every time you make a subscription
  @override
  Stream<Response> request(Request request, [forward]) async* {
    /// first get the token by your own way
    String? token = await EpiconeFirebase.getIdToken(true);

    /// check is connection is null or the token changed
    if (_connection == null || _connection!.token != token) {
      connectOrReconnect(token);
    }
    yield* _connection!.client.subscribe(request, true);
  }

  /// Connects or reconnects to the server with the specified headers.
  void connectOrReconnect(String? token) {
    _connection?.client.dispose();
    var _url = Uri.parse(url);
    if (kIsWeb) {
      /// web don't support headers in sockets so you may need to pass it as query string
      /// server must support that
      _url = _url.replace(queryParameters: {"access_token": token});
    }
    _connection = _Connection(
      client: SocketClient(
        _url.toString(),
        config: SocketClientConfig(
          autoReconnect: false,
          headers: kIsWeb || token == null
              ? null
              : {"Authorization": " Bearer $token"},
          parser: GraphqlLogErrorResponseParserProxy(),
          serializer: SentryRequestSerializer(),
        ),
      ),
      token: token,
    );
  }

  @override
  Future<void> dispose() async {
    await _connection?.client.dispose();
    _connection = null;
  }
}

/// this a wrapper for web socket to hold the used token
class _Connection {
  SocketClient client;
  String? token;
  _Connection({
    required this.client,
    required this.token,
  });
}
