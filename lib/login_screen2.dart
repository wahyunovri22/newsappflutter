
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/home_screen.dart';
import 'package:berita_kita/home_screen2.dart';
import 'package:flutter/material.dart';

class LoginScreen2 extends StatelessWidget {

  LoginScreen2({super.key});

  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Halaman Login",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(onPressed: (){
            ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.success,
                    title: "A success message!",
                    text: "Show a success message with an icon"));
          }, icon: Icon(Icons.settings, color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.white,))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(children: [
        const SizedBox(height: 35),
        Container(alignment: Alignment.topLeft,
        child: Image.asset("assets/images/logouniv.png",
          height: 55,),),
        Container(alignment: Alignment.bottomLeft,
        child: Text("News",style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold,fontSize: 20),),),
        Container(alignment: Alignment.bottomLeft,
        child: Text("Aplikasi Berita Univeristas Ngudi Waluyo",style: TextStyle(color: Colors.black,
            fontSize: 12),),),
        const SizedBox(height: 7),
        TextFormField(
          controller: username,
          decoration: const InputDecoration(
            labelText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
            )
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
              )
          ),
        ),
        const SizedBox(height: 15),
        InkWell(onTap: (){
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.info,
                  title: "Pemberitahuan",
                  text: "Fitur Dalam Pengembangan"));
        },child: Container(
          alignment: Alignment.topRight,
          child: Text("Lupa Password",style: TextStyle(
              color: Colors.blue,fontWeight: FontWeight.bold
          ),),
        ),),
        const SizedBox(height: 35),
        GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen2(title: "${username.value.text}",)));
        },child: Container(margin: EdgeInsets.symmetric(horizontal: 12),
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue
          ),
          child: Center(child: Text("Masuk",style: TextStyle(color: Colors.white),),),),)
      ],),),
    );
  }
}
