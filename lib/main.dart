import 'package:flutter/material.dart';

//fungsi yang pertama kali di jalankan oleh flutter
void main() {
  //new mengartikan pemanggilan sebuah widget,
  //yang berarti MaterialApp adalah sebuah widget yang dipanggil
  //runApp mengartikan aplikasi yang akan di run
  runApp(new MaterialApp(
    //ini berfungsi ketika aplikasi kita minimize, maka nama title akan muncul
    title: "Flutter Hero",
    home: new MyApp(),
  ));
}

//membuat class
class MyApp extends StatelessWidget{
  @override
  //setiap membuat widget, harus memberikan hasil / memberikan nilai balik
  Widget build(BuildContext context) {
    //Scaffold ini jika di native android mengartikan sebuah activity
    //dimana didalam activity terdapat beberapa view yang akan kita buat
    return new Scaffold(
      //membuat warna background scaffold
//        backgroundColor: Colors.white,
      appBar: new AppBar(
        //ini berfungsi untuk memberikan warna background pada AppBar Layout
        backgroundColor: Colors.blue,
        //leading mengartikan tampilan disebelah kiri pada bagian AppBar Layout
        leading: new Icon(Icons.home),
        //ini berfungsi untuk membuat text/title berada ditengah pada AppBar Layout
        title: new Center(
          child: new Text("Flutter Hero"),
        ),
      ),
      body: Hero(
        tag: 'flutterLogo',
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HeroExamplePage())),
          child: Image.asset("images/flutter.png", width: 250.0, height: 100.0,),
        ),
      ),
    );
  }
}

class HeroExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Image'),
      ),
      body: Center(
        child: Hero(
          tag: 'flutterLogo',
          child: Image.asset("images/flutter.png"),
        ),
      ),
    );
  }
}