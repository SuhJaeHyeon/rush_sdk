import 'dart:io';

import 'package:cloudflare/cloudflare.dart';

final cloudflare = Cloudflare(
  accountId: "777521668d453452db76a1637466b247",
  token: "HaO75lqRcB4dv0wIDTgoa0YRxa1WyNp5NjceDK71",
);

Future<String> imageUploadFromPath(
  String path, {
  String? endWith,
}) async {
  try {
    var result = await cloudflare.imageAPI.upload(
      contentFromFile: DataTransmit<File>(data: File(path)),
    );

    if (result.body == null || result.body!.variants.isEmpty) {
      throw 'Image Upload is Failed';
    }

    // origin 이미지를 가져온다.
    // 없으면 첫번째 이미지.
    var images = result.body!.variants;
    return images.firstWhere(
      (url) => url.endsWith(endWith ?? "origin") || url.endsWith("original"),
      orElse: () => images[0],
    );
  } catch (e) {
    rethrow;
  }
}

Future<List<String>> multiImageUploadFromPaths(List<String> paths) async {
  try {
    return Future.wait<String>(paths.map((path) => imageUploadFromPath(path)));
  } catch (e) {
    rethrow;
  }
}
