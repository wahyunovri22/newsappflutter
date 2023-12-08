
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/network/network_repository.dart';
import 'package:berita_kita/ui/home/home_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:html' as html;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class AddScreen extends StatefulWidget {

  const AddScreen({super.key, required this.title});
  final String title;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  XFile? image = null;
  TextEditingController judul = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  @override
  void initState() {
    super.initState();
    _permissionCamera();
  }

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
          controller: judul,
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
          controller: deskripsi,
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
          child: GestureDetector(onTap: ambilFoto,child: Container(width: 100,height: 100,color: Colors.blue,
            child: Stack(children: [
              Align(alignment: Alignment.topCenter,
              child: image != null
                  ? Image.network(image?.path ?? "",fit: BoxFit.cover,height:100,width: 100,)
                  : Container(color: Colors.blue,),),
              Align(alignment: Alignment.topRight,child: GestureDetector(onTap: (){
                hapusFoto();
              },child: Container(
                margin: const EdgeInsets.all(10),
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x88ffffff)),
                child: const Icon(Icons.close, size: 20,color: Colors.black,),
              ),),)
            ],),),),
        ),
        const SizedBox(height: 35),
        GestureDetector(onTap: (){
          addNews();
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

  ambilFoto() async {
    var _image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 70);
    setState(() {
      setImage(_image);
    });
  }

  Future setImage(img) async {
    image = img;
  }

  hapusFoto() {
    setState(() {
      image = null;
    });
  }

  addNews() async {
    EasyLoading.show(status: 'loading...');
    NetworkRepository.addNews(image,judul.text, deskripsi.text).then((value){
      EasyLoading.dismiss();
      munculDialog();
    }).catchError((onError){
      EasyLoading.dismiss();
      errorMessage(onError.toString(), context);
    });
   }

  _permissionCamera() async {
    final perm =
    await html.window.navigator.permissions?.query({"name": "camera"});
    if (perm?.state == "denied") {
      const snackBar = SnackBar(
        content: Text('Oops! Camera access denied!'),
        backgroundColor: Colors.orangeAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    // final stream = await html.window.navigator.getUserMedia(video: true);
  }

  void munculDialog(){
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Pesan",
            text: "Benambahan berita berhasil ?",
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
