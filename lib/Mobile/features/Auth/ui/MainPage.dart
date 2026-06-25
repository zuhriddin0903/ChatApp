import 'package:chatapp/Mobile/features/Auth/ui/RegisterPage.dart';
import 'package:chatapp/Mobile/features/Home/ui/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth_Gate extends StatelessWidget {
  const Auth_Gate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return  RegisterPage();
          }
        },
      ),
    );
  }
}
