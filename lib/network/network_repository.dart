
import 'dart:convert';

import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/model/response_login.dart';
import 'package:berita_kita/model/response_news.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {

  static Future<ResponseLogin> login(String username,String password) async {
    var uri = Uri.https(BASE, LOGIN);
    var body = {'username': username, 'password':password};
    var apiResult = await http.post(uri, body: body);
    var jsonku = json.decode(apiResult.body);
    return ResponseLogin.fromJson(jsonku);
  }

  static Future<ResponseNews> getNews() async {
    var uri = Uri.https(BASE, NEWS);
    var apiResult = await http.get(uri);
    var jsonku = json.decode(apiResult.body);
    return ResponseNews.fromJson(jsonku);
  }
}