
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/helper/Config.dart';
import 'package:berita_kita/ui/home/home_screen2.dart';
import 'package:berita_kita/network/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController username = TextEditingController();
  TextEditingController passsword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Halaman Login",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(onPressed: (){
            ArtSweetAlert.show(
                context: context,
                artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.success,
                    title: "A success message!",
                    text: "Show a success message with an icon"));
          }, icon: const Icon(Icons.settings, color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: Colors.white,))
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(12),
        child: Column(children: [
          const SizedBox(height: 35),
          Container(alignment: Alignment.topLeft,
            child: Image.asset("assets/images/logouniv.png",
              height: 55,),),
          Container(alignment: Alignment.bottomLeft,
            child: const Text("News",style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,fontSize: 20),),),
          Container(alignment: Alignment.bottomLeft,
            child: const Text("Aplikasi Berita Univeristas Ngudi Waluyo",style: TextStyle(color: Colors.black,
                fontSize: 12),),),
          const SizedBox(height: 14),
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
            controller: passsword,
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
            child: const Text("Lupa Password",style: TextStyle(
                color: Colors.blue,fontWeight: FontWeight.bold
            ),),
          ),),
          const SizedBox(height: 35),
          GestureDetector(onTap: (){
            loginUser();
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen2(title: "${username.value.text}",)));
          },child: Container(margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue
            ),
            child: const Center(child: Text("Masuk",style: TextStyle(color: Colors.white),),),),)
        ],),),
    );
  }

  loginUser(){
    EasyLoading.show(status: 'loading...');
    NetworkRepository.login(username.text, passsword.text).then((value){
      EasyLoading.dismiss();
      if (value.error == false) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen2(title: username.value.text,)));
        //successMessage(value.message, context);
      }else{
        errorMessage(value.message, context);
      }
    }).catchError((onError){
      EasyLoading.dismiss();
      errorMessage(onError.toString(), context);
    });
  }
}

