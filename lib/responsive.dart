import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget Mobile;
  final  Widget Tablet;
  final Widget Desktop;
   Responsive({super.key, required this.Mobile, required this.Tablet, required this.Desktop});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains){
          if(constrains.maxWidth<550){
            return Mobile;
          }else if(constrains.maxWidth<1000){
            return Tablet;
          }else{
            return Desktop;
          }
    });
  }
}
