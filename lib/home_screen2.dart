
import 'package:berita_kita/data_berita2.dart';
import 'package:berita_kita/item_berita2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {

  const HomeScreen2({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: ListView.builder(itemCount:InsertBerita2().createBerita().length,
          itemBuilder: (context, i){
            return ItemBerita2(image: InsertBerita2().createBerita()[i].image,
            judul: InsertBerita2().createBerita()[i].judul,
            tema: InsertBerita2().createBerita()[i].tema,
            penerbit: InsertBerita2().createBerita()[i].penerbit,);
          }),),
    );
  }
}

