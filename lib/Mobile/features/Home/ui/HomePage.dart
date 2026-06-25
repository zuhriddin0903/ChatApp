import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

   MyHomePage({super.key});

  var user= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$user"),
        backgroundColor: Colors.black12,
      ),
    );
  }
}
