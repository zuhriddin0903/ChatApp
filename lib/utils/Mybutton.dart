import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final buttonName;
  final void Function() onTap;
   Mybutton({super.key,required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text( buttonName, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
