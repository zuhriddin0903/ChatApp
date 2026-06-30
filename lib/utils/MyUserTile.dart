import 'package:flutter/material.dart';


class UserTile extends StatelessWidget {
  final text;
  final void Function()? ontap;
  const UserTile({super.key, required this.text,required this.ontap,});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(text),
        onTap: ontap,

      ),
    );
  }
}
