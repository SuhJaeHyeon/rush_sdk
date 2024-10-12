import 'package:sentry_flutter/sentry_flutter.dart';

class SentryUtil {
  static final SentryUtil shared = SentryUtil();

  ISentrySpan? root;
  ISentrySpan? storeDetail;
  ISentrySpan? auctionOrderInsert;
  ISentrySpan? auctionOrderUpdate;
}
