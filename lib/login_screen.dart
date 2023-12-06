import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:berita_kita/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _prosesLogin = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        title: Text(
          "Halaman Login",
          style: TextStyle(fontStyle: FontStyle.normal, color: Colors.white),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(12),
      child: Column(children: [
        const SizedBox(height: 25,),
        Container(alignment: Alignment.topLeft,
        child: Image.asset("assets/images/logouniv.png",
          height: 55,),),
        Container(alignment: Alignment.topLeft,
          child: Text("News",style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,fontSize: 25),),),
        Container(alignment: Alignment.topLeft,
          child: Text("Aplikasi berita universitas ngudi waluyo",style: TextStyle(color: Colors.black, fontSize: 13),),),
        const SizedBox(height: 30,),
        TextFormField(autofocus: false,
        controller: nameController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person,color: Colors.black26,),
          labelText: "username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          )
        ),),
        const SizedBox(height: 20,),
        TextFormField(autofocus: false,
          controller: passwordController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock,color: Colors.black26,),
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
              )
          ),),
        const SizedBox(height: 15,),
        Container(alignment: Alignment.topRight,
        child: InkWell(onTap: (){
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.info,
                  title: "Pemberitahuan",
                  text: "Fitur Dalam pengembangan"));
        },
        child: Text("Lupa Password",style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,fontSize: 13),),),),
        const SizedBox(height: 15,),
        _buttonLogin()
      ],),),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: InkWell(child: Card(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
        color: Colors.blue,
        child:
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Visibility(visible: _prosesLogin == false ? true : false,child: const Text("Masuk", style:
            TextStyle(
                color: Colors.white
            ),),),
            Visibility(visible: _prosesLogin,child: Container(
              width: 32,
              height: 32,
              child: const CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.white,
              ),
            ),)
          ],),
        ),),onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(title: "${nameController.text}",)));
      },),
    );
  }
}
