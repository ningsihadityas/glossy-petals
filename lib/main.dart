
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:glossypetals2/login.dart';

import 'homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Glossy Petals App",
      home: new HomePage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LogInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('img/Rectangle24.png'),
      ),
      backgroundColor: Color(0xFFE9FDFB),
    );
  }
}


//TEST UNTUK FIRESTORE

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:glossypetals2/homepage.dart';
// import 'dart:async';

// import 'package:glossypetals2/login.dart';

// //void main() => runApp(new MyApp());
// Future<DocumentSnapshot> getCurrentBalance()async{

//   final databaseReference = Firestore.instance;

//   DocumentSnapshot documentSnapshot;
//   try{

//     //create database
//     await databaseReference.collection('flowers').add({"kelas": "dua"}).then((test){});

//     //await databaseReference.collection('flowers').document('vIVBnD6JJBUZZ5DGKWcc').delete().then((test){});

//     //Update Data / Edit
//     // await databaseReference.collection('flowers').document('vIVBnD6JJBUZZ5DGKWcc').updateData({'name':'flower c'}).then((response){
//     // });

//     //GET DOCUMENTS
//     // await databaseReference.collection('flowers').getDocuments().then((response){
//     //   documentSnapshot = response;
//     // });

//   } catch(e){

//   }
//   return documentSnapshot;
// }

// void main(){
//  getCurrentBalance().then((response){
//    print("TEST");
//   //print(response.data);
//  }); 
// }


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Glossy Petals App",
//       home: new MainApp(),
//     );
//   }
// }

// class MainApp extends StatefulWidget {
//   @override
//   _MainAppState createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
