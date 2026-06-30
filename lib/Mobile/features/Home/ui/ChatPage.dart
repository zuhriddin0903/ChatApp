import 'package:chatapp/Mobile/features/Auth/domein/Auth_service.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
   ChatPage({super.key});

final  AuthService _authUser=AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
    );
  }
}
