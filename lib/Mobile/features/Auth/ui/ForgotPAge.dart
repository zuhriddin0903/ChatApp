import "package:chatapp/Mobile/features/Auth/domein/Auth_service.dart";
import "package:chatapp/utils/MyTextfield.dart";
import "package:chatapp/utils/Mybutton.dart";
import "package:flutter/material.dart";

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _emailcontroller = TextEditingController();

  Future ForgotPassword()async{
   AuthService _ForgotAUthService=AuthService();
_ForgotAUthService.sendPasswordResetEmail(_emailcontroller.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "if you forgot your password edit me your email!!!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              MyTextField(
                obscureText: false,
                hintText: "email",
                controller: _emailcontroller,
              ),
              SizedBox(height: 12),
              Mybutton(buttonName: "SEND", onTap: ForgotPassword),
            ],
          ),
        ),
      ),
    );
  }
}
