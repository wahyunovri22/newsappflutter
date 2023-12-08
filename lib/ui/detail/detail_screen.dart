
import 'dart:js';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/model/response_news.dart';
import 'package:berita_kita/network/network_repository.dart';
import 'package:berita_kita/ui/home/home_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DetailScreen extends StatefulWidget {

  const DetailScreen({super.key, required this.dataNews});
  final News dataNews;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
        child: Stack(children: [
          Align(alignment: Alignment.topCenter,
            child: Column(children: [
              Container(color: Colors.green,
                height: 300,
                child: Image.network("${widget.dataNews.cover}",
                  height: 300,
                  fit: BoxFit.cover,),),
            ],),),
          Align(alignment: Alignment.topLeft,
            child:  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Container(
                margin: const EdgeInsets.all(10),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x88ffffff)),
                child: const Icon(Icons.arrow_back_ios_new, size: 20,color: Colors.white,),
              ),),
              const SizedBox(height: 170,),
              Container(margin: const EdgeInsets.only(left: 26),
                child: Text("${widget.dataNews.tanggal}",style: const TextStyle(color: Colors.white),),),
              const SizedBox(height: 10,),
              Flexible(child: Container(
                padding: const EdgeInsets.all(14),
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logouniv.png'),
                    ),
                    const SizedBox(width: 10,),
                    Flexible(child: Text("${widget.dataNews.judul}",style: const TextStyle(color: Colors.black),))
                  ],),
                  const SizedBox(height: 12,),
                  Flexible(child: ListView(children: [
                    Text("${widget.dataNews.deskripsi}",style: const TextStyle(color: Colors.black54),)
                  ],))
                ],),))
            ],),),
          Align(alignment: Alignment.topRight,
            child:  Container(
              margin: const EdgeInsets.all(10),
              width: 40,
              height:40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x88ffffff)),
              child: Material(
                color: Colors.transparent,
                child: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                        value: 'update',
                        child: Row(
                          children: [
                            Icon(Icons.update,
                                size: 13),
                            SizedBox(width: 4),
                            Text(
                              "Update",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )
                    ),
                    const PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete,
                                size: 13),
                            SizedBox(width: 4),
                            Text(
                              "Hapus",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 24,
                  ),
                  onSelected: (index) async {
                    switch (index) {
                      case 'update': errorMessage("Update", context);
                      case 'delete': deleteNews(context);
                      break;
                    }
                  },
                ),
              ),
            ),),
        ],),),
    );
  }

  deleteNews(BuildContext context){
    EasyLoading.show(status: 'loading...');
    NetworkRepository.delete("${widget.dataNews.id}").then((value){
      EasyLoading.dismiss();
      if (value.kode == 1) {
        showDialog(context,value.pesan);
      }else{
        errorMessage(value.pesan, context);
      }
    }).catchError((onError){
      EasyLoading.dismiss();
      errorMessage(onError.toString(), context);
    });
  }

  void showDialog(BuildContext context,String? pesan){
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Pesan",
            text: "$pesan",
            onConfirm: (){
              Navigator.of(context).popUntil((route) => route.isFirst);
              setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen2(title: "",)));
              });
            }
        )
    );
  }
  
}

