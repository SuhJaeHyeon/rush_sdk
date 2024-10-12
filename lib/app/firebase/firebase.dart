
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rush_sdk/client/client_controller.dart';
import 'package:rush_sdk/error/failures.dart';

class EpiconeFirebase {
  static final EpiconeFirebase shared = EpiconeFirebase();
  late final AndroidNotificationChannel channel;

  init(FirebaseOptions options) async {
    await Firebase.initializeApp(options: options);

    ////////// Local Notifications
    // IOS
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
    );

    // Android
    channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'interaction notifications', // title
      description: 'interaction notifications for user',
      importance: Importance.max,
    );
  }

  Future<void> setUpMessages() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // GotoPath.shared.fromRemoteMessage(initialMessage);
    }

    // FirebaseMessaging.onMessageOpenedApp
    //     .listen(GotoPath.shared.fromRemoteMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
              ),
            ));
      }
    });
  }

  static Future<String?> getIdToken([bool forceRefresh = false]) async {
    return await FirebaseAuth.instance.currentUser?.getIdToken(forceRefresh);
  }

  static Future<String> getIdTokenOrThrow([bool forceRefresh = false]) async {
    // final String? idToken = ClientController.USER_MODE
    //     ? ""
    //     : await FirebaseAuth.instance.currentUser?.getIdToken(forceRefresh);
    // if (idToken == null) throw ServerFailure("id token is null");
    // return idToken;
    return "";
  }
}
