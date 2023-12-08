
import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/model/response_login.dart';
import 'package:berita_kita/ui/home/home_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

const String BASE = "ods.web.id";
const String LOGIN = "/pemantik/unwapi/login.php";
const String NEWS = "/pemantik/unwapi/getNews.php";
const String ADDNEWS = "/pemantik/unwapi/addNews.php";
const String DELETENEWS = "/pemantik/unwapi/deleteNews.php";

void errorMessage(String? pesan,BuildContext context) {
  ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger, title: "Error", text: pesan));
}

void successMessage(String? pesan,BuildContext context) {
  ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success, title: "Success", text: pesan));
}

final getStorage = GetStorage();
const KEY_CREDENTIAL_USER = "Credential";

ResponseLogin? getUserCredential() {
  String? userCredential = getStorage.read(KEY_CREDENTIAL_USER);
  if (userCredential != null) {
    return ResponseLogin.fromJson(jsonDecode(userCredential));
  } else {
    return null;
  }
}