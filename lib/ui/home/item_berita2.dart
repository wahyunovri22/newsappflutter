
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBerita2 extends StatelessWidget {

  String? image,judul,tema,penerbit;
  final VoidCallback? onTap;

  ItemBerita2({Key? key, this.image,this.judul,
  this.tema, this.penerbit,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
      margin: EdgeInsets.only(bottom: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network("${image}",
              height: 80,
              width: 80,
              fit: BoxFit.cover,),
          ),
          const SizedBox(width: 6,),
          Flexible(child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$tema",style: TextStyle(color: Colors.black26,fontSize: 9),),
              Text("$judul",style: TextStyle(color: Colors.black,fontSize: 13),),
              Text("$penerbit",style: TextStyle(color: Colors.black26,fontSize: 9),),
            ],))
        ],
      ),
    ),
    onTap: onTap,);
  }
}
