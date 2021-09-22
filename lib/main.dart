import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/pages/opening_page.dart';
import 'package:uber_clone/pages/sign_up_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OpeningPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        SignUpPage.route: (context) => SignUpPage(),
        OpeningPage.route: (context) => OpeningPage(),
        HomePage.route: (context) => HomePage(),
      },
    );
  }
}
