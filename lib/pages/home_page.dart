import 'package:flutter/material.dart';
import 'package:uber_clone/services/auth.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = "/home";

  Future<void> _signOut(BuildContext context) async {
    final Auth _auth = Auth();
    await _auth.signOut();
    if(_auth.currentUser == null) Navigator.pushNamedAndRemoveUntil(context, LoginPage.route, (route) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Uber Clone.'),
        actions: [
          IconButton(onPressed: () => _signOut(context), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
