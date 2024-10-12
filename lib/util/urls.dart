import 'package:url_launcher/url_launcher_string.dart';

class Urls {
  static String getInviteCodePage(
    String inviteCode,
    int cash,
    int withdrawal,
    int friendCount,
  ) =>
      Uri.parse("https://epicone.co.kr/invite/share").replace(
        queryParameters: {
          "invite_code": inviteCode,
          "cash": cash.toString(),
          "withwail_cash": withdrawal.toString(),
          "friend_count": friendCount.toString(),
        },
      ).toString();

  static Future<bool> launch(String url) async =>
      await launchUrlString(url, mode: LaunchMode.externalApplication);

  static goComingSoonFurniture() {
    return launch("https://epicone.channel.io/support-bots/88777");
  }

  static goComingSoonFineArt() {
    return launch("https://epicone.channel.io/support-bots/55658");
  }

  static getKakoMapUrl() {
    return "https://m.map.kakao.com/actions/detailMapView?id=1444552042&refService=place&q=%EB%B0%A4%EB%B6%80%20%EC%84%B1%EC%88%98";
  }
}
