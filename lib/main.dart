import 'package:chatapp/Desktop/DesktopHome.dart';
import 'package:chatapp/Mobile/features/Auth/ui/LoginPage.dart';
import 'package:chatapp/Tablet/TabletHome.dart';
import 'package:chatapp/responsive.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home:Responsive(Mobile: Loginpage(), Tablet: Tablethome(), Desktop: Desktophome()),
    );
  }
}
