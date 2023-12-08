
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/widgets.dart';

const String BASE = "ods.web.id";
const String LOGIN = "/pemantik/unwapi/login.php";
const String NEWS = "/pemantik/unwapi/getNews.php";

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