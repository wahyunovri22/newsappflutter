import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBerita extends StatelessWidget {

  final String? image;
  final String? judul;
  final String? tema;
  final String? owner;

  const ItemBerita({Key? key, this.image,this.judul,this.owner,this.tema}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "$image", width: 80,height: 80,
            fit: BoxFit.cover,),),
          const SizedBox(
            width: 7,
          ),
          Flexible(child:
          Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start,children: [
            Text("$tema",style: const TextStyle(fontSize: 9,color: Colors.black26),),
            const SizedBox(height: 5,),
            Text("$judul",
              style: const TextStyle(fontSize: 12,color: Colors.black),),
            const SizedBox(height: 10,),
            Text("$owner",style: const TextStyle(fontSize: 9,color: Colors.black26),),
          ],))
        ],
      ),
    );
  }
}
