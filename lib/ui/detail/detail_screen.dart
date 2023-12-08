

import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/model/response_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key, required this.dataNews});
  final News dataNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
      child: Stack(children: [
        Align(alignment: Alignment.topCenter,
          child: Column(children: [
            Container(color: Colors.green,
              height: 300,
            child: Image.network("${dataNews.cover}",
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
            SizedBox(height: 170,),
            Container(margin: EdgeInsets.only(left: 26),
            child: Text("${dataNews.tanggal}",style: TextStyle(color: Colors.white),),),
            SizedBox(height: 10,),
            Flexible(child: Container(
              padding: EdgeInsets.all(14),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
              ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Row(children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logouniv.png'),
                ),
                SizedBox(width: 10,),
                Flexible(child: Text("${dataNews.judul}",style: TextStyle(color: Colors.black),))
              ],),
              SizedBox(height: 12,),
              Flexible(child: ListView(children: [
                Text("${dataNews.deskripsi}",style: TextStyle(color: Colors.black54),)
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
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                ),
                onSelected: (index) async {
                  switch (index) {
                    case 'update': errorMessage("tes", context);
                    case 'delete': successMessage("yey", context);
                    break;
                  }
                },
              ),
            ),
          ),),
      ],),),
    );
  }
}
