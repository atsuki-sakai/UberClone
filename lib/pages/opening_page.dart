import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'package:uber_clone/componets/status_bar_Style.dart';
import 'package:uber_clone/pages/login_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  static const int _lateSec = 3;

  @override
  void initState() {
    startToPushLoginPage(seconds: _lateSec);
    super.initState();
  }

  void startToPushLoginPage({required int seconds}) {
    Timer.periodic(Duration(seconds: seconds), (timer) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return LoginPage();
            }),
        (route) => true,
      );
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarStyle(
      brightness: Brightness.light,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ShadowText(
                  title: 'Uber Clone',
                  isBold: true,
                  color: Colors.black,
                  fontSize: 42.0,
                  shadow: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(4, 4),
                      blurRadius: 8.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                ' -- Demo App -- ',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
