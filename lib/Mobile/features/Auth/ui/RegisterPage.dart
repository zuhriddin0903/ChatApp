import 'package:chatapp/Mobile/features/Auth/domein/Auth_service.dart';
import 'package:chatapp/Mobile/features/Home/ui/HomePage.dart';
import 'package:flutter/material.dart';


import 'package:chatapp/utils/MyTextfield.dart';
import 'package:chatapp/utils/Mybutton.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<RegisterPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _Confirmpasswordcontroller=TextEditingController();

  void register(BuildContext context) async{
    final _auth = AuthService();
    if (_passwordcontroller.text == _Confirmpasswordcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailcontroller.text,
          _passwordcontroller.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Parollar mos kelmadi!"),
          content: Text("Iltimos, parollarni qayta tekshiring."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat, size: 70),
              SizedBox(height: 10),
              Text("Welcome to the Register"),
              SizedBox(height: 10),
              MyTextField(
                obscureText: false,
                hintText: "email",
                controller: _emailcontroller,
              ),
              SizedBox(height: 10),
              MyTextField(
                obscureText: true,
                hintText: "password",
                controller: _passwordcontroller,
              ),
              SizedBox(height: 10),
              MyTextField(
                obscureText: true,
                hintText: "confirmpassword",
                controller: _Confirmpasswordcontroller,
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?', style: TextStyle(color: Colors.red)),
                ],
              ),
              SizedBox(height: 10),
              Mybutton(buttonName: 'Sign In', onTap:()=>register(context) ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
