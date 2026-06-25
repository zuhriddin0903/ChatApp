import 'package:chatapp/Mobile/features/Auth/domein/Auth_service.dart';
import 'package:chatapp/Mobile/features/Auth/ui/RegisterPage.dart';
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

  Future SignIn() async {
    AuthService authService = AuthService();
    authService.signInWithEmailPassword(
      _emailcontroller.text.trim(),
      _passwordcontroller.text.trim(),
    );
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPage()));
                    },
                    child: Text('Forgot Password?', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Mybutton(buttonName: 'Sign Up', onTap: SignIn),
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
            ],
          ),
        ),
      ),
    );
  }
}
