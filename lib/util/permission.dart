import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rush_sdk/app/firebase/firebase.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';
import 'package:rush_sdk/widget/alert.dart';

class EpicPermission {
  static Future<bool> camera(BuildContext context) async {
    if ((await Permission.camera.request()).isPermanentlyDenied) {
      await _permissionAlert(
        title: '카메라 권한 허용 필요',
        content: '에픽원이 카메라에\n접근하려면 권한을 허용해야합니다.',
        doneText: "설정하기",
        context: context,
      );
    }

    return await Permission.camera.isGranted;
  }

  static Future<bool> photo(BuildContext context) async {
    bool isPermanentlyDenied = true;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        isPermanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
      } else {
        isPermanentlyDenied =
            await Permission.photos.request().isPermanentlyDenied;
      }
    } else {
      isPermanentlyDenied =
          await Permission.photos.request().isPermanentlyDenied;
    }

    if (isPermanentlyDenied) {
      await _permissionAlert(
        context: context,
        title: '사진첩 권한 요청',
        content: '사진첩 접근 권한을 허용해야\n스타일 사진 업로드가 가능합니다.',
        doneText: "설정으로 이동하기",
      );
    }

    return (Platform.isAndroid && await Permission.storage.isGranted) ||
        await Permission.photos.isGranted ||
        (Platform.isIOS && await Permission.photos.isLimited);
  }

  static Future<bool> isNotiGranted() async =>
      await Permission.notification.isGranted;

  static Future<bool> noti(bool request) async {
    if (await isNotiGranted()) {
      await _initLocalNotificatiion();
    } else {
      if (request) {
        var status = await Permission.notification.request();
        if (status.isPermanentlyDenied) await openAppSettings();
        if (await isNotiGranted()) {
          await _initLocalNotificatiion();
        }
      }
    }

    return await isNotiGranted();
  }

  static Future<bool> appTracking() async =>
      (await Permission.appTrackingTransparency.request()).isGranted;

  static _initLocalNotificatiion() async {
    await FlutterLocalNotificationsPlugin().initialize(InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    ));

    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(EpiconeFirebase.shared.channel);
  }

  static Future<void> _permissionAlert({
    required String title,
    required String content,
    required String doneText,
    required BuildContext context,
  }) async {
    return await customAlert<void>(
      title: title,
      content: Text(
        content,
        style: AppTextStyle.text14.copyWith(
          color: AppColors.grey13,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      cancelText: "확인",
      doneText: doneText,
      doneTap: () async {
        await openAppSettings();
      },
      context: context,
    );
  }
}
