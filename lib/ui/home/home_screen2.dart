import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/ui/add/add_screen.dart';
import 'package:berita_kita/ui/detail/detail_screen.dart';
import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/ui/home/item_berita2.dart';
import 'package:berita_kita/model/response_news.dart';
import 'package:berita_kita/network/network_repository.dart';
import 'package:berita_kita/ui/login/login_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<News> dataNews = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Halaman Berita",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: <Widget>[
            Material(
              color: Colors.transparent,
              child: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  const PopupMenuItem<String>(
                      value: 'exit',
                      child: Row(
                        children: [
                          Icon(Icons.logout, size: 13,color: Colors.black54,),
                          SizedBox(width: 4),
                          Text(
                            "Exit",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )),
                ],
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
                onSelected: (index) async {
                  switch (index) {
                    case 'exit':
                      munculDialog();
                      break;
                  }
                },
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  itemCount: dataNews.length,
                  itemBuilder: (context, i) {
                    return ItemBerita2(
                      image: dataNews[i].cover,
                      judul: dataNews[i].judul,
                      tema: dataNews[i].userinput,
                      penerbit: dataNews[i].tanggal,
                      onTap: () {
                        goToDetail(dataNews[i]);
                      },
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  goToAdd();
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  goToDetail(News news) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailScreen(dataNews: news)));
  }

  goToAdd() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddScreen(
                  title: "Tambah Berita",
                )));
  }

  getNews() {
    EasyLoading.show(status: 'loading...');
    NetworkRepository.getNews().then((value) {
      EasyLoading.dismiss();
      if (value.error == false) {
        setState(() {
          dataNews = value.news ?? [];
        });
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen2(title: "${username.value.text}",)));
        //successMessage('${value.news?.length}', context);
      } else {
        errorMessage("Data tidak ditemukan", context);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      errorMessage(onError.toString(), context);
    });
  }

  void munculDialog(){
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.info,
            title: "Pesan",
            text: "Apakah anda ingin meninggalkan aplikasi ?",
            onConfirm: (){
              getStorage.remove(KEY_CREDENTIAL_USER);
              Navigator.of(context).popUntil((route) => route.isFirst);
              setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen2()));
              });
            }
        )
    );
  }
}
