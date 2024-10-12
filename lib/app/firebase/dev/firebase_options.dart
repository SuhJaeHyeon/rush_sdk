// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class FirebaseOptionsDev {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7XoFCn1qKuv8h64lFogSb-BaHqpdCSS0',
    appId: '1:666982064584:android:4b2d69af35cb07f33be0fd',
    messagingSenderId: '666982064584',
    projectId: 'epicone-dev',
    storageBucket: 'epicone-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDR5mmu1stPTRJPk_u7veaBmtbAR6BMN9s',
    appId: '1:666982064584:ios:4089948447a66fd63be0fd',
    messagingSenderId: '666982064584',
    projectId: 'epicone-dev',
    storageBucket: 'epicone-dev.appspot.com',
    androidClientId:
        '666982064584-abof9up9bjlonk41mf0hotvfhqe2jief.apps.googleusercontent.com',
    iosClientId:
        '666982064584-4l7fvuh9qprb79g7sc85s8jof2a54tml.apps.googleusercontent.com',
    iosBundleId: 'io.epiccorp.one.dev',
  );
}
