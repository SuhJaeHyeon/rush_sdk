import 'dart:developer';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Pretty extends PrettyDioLogger {
  Pretty()
      : super(
          // requestHeader: true,
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          logPrint: (s) => log('\x1B[32m$s', name: "|"),
        );
}
