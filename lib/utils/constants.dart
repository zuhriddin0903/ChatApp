import 'package:flutter/material.dart';


final MyDrawer=Drawer(
  child: Column(
    children: [
      DrawerHeader(child: Icon(Icons.chat)),
      ListTile(
        title: Text("HOME"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),ListTile(
        title: Text("CHAT"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),ListTile(
        title: Text("SETTINGS"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),ListTile(
        title: Text("USERS"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ],
  ),
);