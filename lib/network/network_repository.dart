
import 'dart:convert';
import 'dart:typed_data';

import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/model/response_login.dart';
import 'package:berita_kita/model/response_news.dart';
import 'package:berita_kita/model/response_post.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class NetworkRepository {

  static Future<ResponseLogin> login(String username,String password) async {
    var uri = Uri.https(BASE, LOGIN);
    var body = {'username': username, 'password':password};
    var apiResult = await http.post(uri, body: body);
    var jsonku = json.decode(apiResult.body);
    ResponseLogin responseLogin = ResponseLogin.fromJson(jsonku);
    if (responseLogin.error == false) {
      getStorage.write(KEY_CREDENTIAL_USER, apiResult.body);
    }
    return ResponseLogin.fromJson(jsonku);
  }

  static Future<ResponseNews> getNews() async {
    var uri = Uri.https(BASE, NEWS);
    var apiResult = await http.get(uri);
    var jsonku = json.decode(apiResult.body);
    return ResponseNews.fromJson(jsonku);
  }

  static Future<int?> addNews(XFile? image,String des, String judul) async {
    Uint8List data = await image!.readAsBytes();
    List<int> fotoku = data.cast();
    var uri = Uri.https(BASE,ADDNEWS);

    var request = http.MultipartRequest("POST", uri)
      ..fields['judul'] = judul
      ..fields['deskripsi'] = des
      ..fields['userinput'] = "admin"
      ..files.add(http.MultipartFile.fromBytes('uploaded_file', fotoku,
          filename: image.name));
    var res = await request.send();

    res.stream.transform(utf8.decoder).listen((value) {
      var parsedJson = json.decode(value);
      return parsedJson['kode'];
    });
  }

  static Future<ResponsePost> delete(String id) async {
    var uri = Uri.https(BASE, DELETENEWS);
    var body = {'id': id,};
    var apiResult = await http.post(uri, body: body);
    var jsonku = json.decode(apiResult.body);
    return ResponsePost.fromJson(jsonku);
  }
}