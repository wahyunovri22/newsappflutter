

import 'package:berita_kita/model/data_berita.dart';
import 'package:berita_kita/item_berita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: const Text("Halaman Home",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.blue,
    ),
      body: Padding(padding: const EdgeInsets.all(12),
      child: ListView.builder(
          itemCount:InsertBerita().createBerita().length,
          itemBuilder: (context, i){
        return ItemBerita(judul: InsertBerita().createBerita()[i].judul,
        tema: InsertBerita().createBerita()[i].tema,
        owner: InsertBerita().createBerita()[i].owner,
          image: InsertBerita().createBerita()[i].image,);
      }),),);
  }
}

