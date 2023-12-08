
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {

  const AddScreen({super.key, required this.title});
  final String title;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
        const Text("Judul",style: TextStyle(color: Colors.black54),),
        const SizedBox(height: 5,),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13))
              ),
              prefixIcon: Icon(Icons.text_fields,color: Colors.black12,)
          ),
        ),
        const SizedBox(height: 15,),
        const Text("Deskripsi",style: TextStyle(color: Colors.black54),),
        const SizedBox(height: 5,),
        TextFormField(
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 5,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13))
              ),
              prefixIcon: Icon(Icons.description,color: Colors.black12,)
          ),
        ),
        const SizedBox(height: 15,),
        const Text("Cover",style: TextStyle(color: Colors.black54),),
        const SizedBox(height: 5,),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(width: 100,height: 100,color: Colors.blue,
            child: Stack(children: [
              Align(alignment: Alignment.topRight,child: Container(
                margin: const EdgeInsets.all(10),
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x88ffffff)),
                child: const Icon(Icons.close, size: 20,color: Colors.black,),
              ),)
            ],),),
        ),
        const SizedBox(height: 35),
        GestureDetector(onTap: (){

        },child: Container(margin: EdgeInsets.symmetric(horizontal: 12),
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue
          ),
          child: Center(child: Text("${widget.title}",style: TextStyle(color: Colors.white),),),),)
      ],),),
    );
  }
}
