import 'package:chatapp/Mobile/features/Auth/domein/Auth_service.dart';
import 'package:chatapp/Mobile/features/Auth/ui/RegisterPage.dart';
import 'package:chatapp/Mobile/features/Home/ui/HomePage.dart';
import 'package:chatapp/utils/MyTextfield.dart';
import 'package:chatapp/utils/Mybutton.dart';
import 'package:flutter/material.dart';

import 'ForgotPAge.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  void LoginIn(BuildContext context) async {
    final _authlogin = AuthService();
    try {
      await _authlogin.signInWithEmailPassword(
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
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat, size: 70),
              SizedBox(height: 10),
              Text("Welcome to the Login"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPage()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Mybutton(buttonName: 'Sign In', onTap: () => LoginIn(context)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('If you have not account!'),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                ],
              ),
              SizedBox(width: 40),
              ListTile(
                onTap: ()async{
                  try {
                    await AuthService().signInWithGoogle();
                  } catch (e) {
                    // xatolikni ko'rsatish
                  }
                },
                leading: Image.network(
                  "https://cdn-icons-png.flaticon.com/128/300/300221.png",
                ),
                title: Text("Sign in with GOOGLE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
