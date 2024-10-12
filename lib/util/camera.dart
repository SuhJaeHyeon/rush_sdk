import 'dart:io';

import 'package:camera/camera.dart';

class EpicCamera extends CameraController {
  EpicCamera(super.description, super.resolutionPreset, {super.enableAudio});

  /// ### 안드로이드의 경우 포커싱 시간이 너무 오래걸리므로 짧게 찍기위해서 임시 해제
  @override
  Future<XFile> takePicture() async {
    if (Platform.isAndroid) {
      await setFocusMode(FocusMode.locked);
      var file = await super.takePicture();
      await setFocusMode(FocusMode.auto);
      return file;
    } else {
      return await super.takePicture();
    }
  }
}
