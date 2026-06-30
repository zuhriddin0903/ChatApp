import 'package:chatapp/Mobile/features/Auth/domein/Auth_service.dart';
import 'package:chatapp/Mobile/features/Auth/domein/Chat_Service.dart';
import 'package:chatapp/Mobile/features/Home/ui/ChatPage.dart';
import 'package:chatapp/utils/MyUserTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  var user = FirebaseAuth.instance!.currentUser;
  final ChatService _chatService = ChatService();

  void logout() {
    final AuthService Authlogout = AuthService();
    Authlogout.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed:logout, icon: Icon(Icons.arrow_back_ios)),
        title: Text("$user!x"),
        backgroundColor: Colors.black12,
      ),
      drawer: Drawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData,context))
              .toList(),
        ); // ListView
      },
    ); // StreamBuilder
  }

  // build individual list tile for user
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    // display all users except current user
    return UserTile(
      text: userData["email"],
      ontap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
    ); // UserTile
  }
}
