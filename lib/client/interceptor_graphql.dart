import 'package:rush_sdk/util/logger.dart';
import 'package:graphql/client.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_link/sentry_link.dart';

class GraphqlLogErrorResponseParserProxy implements ResponseParser {
  final responseParser = ResponseParser();
  final sentryParser = SentryResponseParser();

  @override
  GraphQLError parseError(Map<String, dynamic> error) {
    sentryParser.parseError(error);
    var result = responseParser.parseError(error);
    _logError([result]);
    return result;
  }

  @override
  Response parseResponse(Map<String, dynamic> body) {
    sentryParser.parseResponse(body);
    var response = responseParser.parseResponse(body);
    _logError(response.errors);
    return response;
  }

  @override
  ErrorLocation parseLocation(Map<String, dynamic> location) {
    sentryParser.parseLocation(location);
    return responseParser.parseLocation(location);
  }

  void _logError(List<GraphQLError>? errors) {
    if (errors?.isNotEmpty == true) {
      var results = {};

      for (var error in errors!) {
        red(error.message);
        results[error.message] = null;
        if (error.path?.isNotEmpty == true) {
          results[error.message] = error.path?.join(", ");
          for (var path in error.path!) {
            red(path);
          }
        }
      }

      if (results.isNotEmpty) {
        Sentry.captureException(
          Exception(results.toString()),
          stackTrace: StackTrace.current,
        );
      }
    }
  }
}
