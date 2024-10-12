import 'dart:convert';
import 'dart:io';

import 'package:rush_sdk/util/string.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PaypleApi {
  final String baseUrl = dotenv.env["payple_url"]!;
  final String cst_id = dotenv.env["payple_cst_id"]!;
  final String custKey = dotenv.env["payple_cust_key"]!;

  Future<String> _auth() async {
    var res = await http.post(
      Uri.parse("$baseUrl/oauth/token"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "cst_id": cst_id,
        "custKey": custKey,
        "code": dotenv.env["payple_code"]!
      }),
    );

    return jsonDecode(res.body)["access_token"];
  }

  Future<String> getAccountOwnerName({
    required String bankCodeStd,
    required String yymmdd,
    required String accountNum,
  }) async {
    var token = await _auth();
    print("Bearer $token");

    // var res = await Dio().post(
    //   "$baseUrl/inquiry/real_name",
    //   options: Options(
    //     headers: {
    //       "Authorization": "Bearer $token",
    //       "Content-Type": "application/json",
    //     },
    //   ),
    //   data: {
    //     "cst_id": cst_id,
    //     "custKey": custKey,
    //     "bank_code_std": bankCodeStd,
    //     "account_num": accountNum.onlyNumber(),
    //     "account_holder_info_type": "0",
    //     "account_holder_info": yymmdd
    //   },
    // );

    var body = jsonEncode({
      "cst_id": cst_id,
      "custKey": custKey,
      "bank_code_std": bankCodeStd,
      "account_num": accountNum.onlyNumber(),
      "account_holder_info_type": "0",
      "account_holder_info": yymmdd
    });
    var req =
        await HttpClient().postUrl(Uri.parse("$baseUrl/inquiry/real_name"));
    req.headers.set("Authorization", "Bearer $token", preserveHeaderCase: true);
    req.headers.contentType = ContentType.json;
    req.contentLength = body.length;

    req.write(body);
    var res = await req.close();

    // var res = await http.post(
    //   Uri.parse("$baseUrl/inquiry/real_name"),
    //   headers: {
    //     // "authorization": "Bearer $token",
    //     "Authorization": "Bearer $token",
    //     "Content-Type": "application/json",
    //   },
    //   body: jsonEncode({
    //     "cst_id": cst_id,
    //     "custKey": custKey,
    //     "bank_code_std": bankCodeStd,
    //     "account_num": accountNum.onlyNumber(),
    //     "account_holder_info_type": "0",
    //     "account_holder_info": yymmdd
    //   }),
    // );

    print("$baseUrl/inquiry/real_name");

    print({
      "cst_id": cst_id,
      "custKey": custKey,
      "bank_code_std": bankCodeStd,
      "account_num": accountNum.onlyNumber(),
      "account_holder_info_type": "0",
      "account_holder_info": yymmdd
    });

    print("======= = == == == ====");
    print(res.statusCode);
    var data = await res.transform(utf8.decoder).join();
    print(data);

    return jsonDecode(data)["account_holder_name"];
  }
}
