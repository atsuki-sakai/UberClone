import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/helpers/toast.dart';
import 'package:uber_clone/models/rider.dart';
import 'package:uber_clone/pages/map_page.dart';
import 'package:uber_clone/services/auth.dart';
import 'package:uber_clone/services/database.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Rider? rider;
  final auth = Auth();

  Future<void> _signOut(BuildContext context) async {
    final Auth _auth = Auth();
    await _auth.signOut();
  }

  Future<void> _fetchRider() async {
    try {
      await _updateRider();
    } on FirebaseException catch (error) {
      toast(context: context, msg: error.message!);
    }
  }

  Future<void> _updateRider() async {
    final RidersDatabase database = RidersDatabase();
    final _rider = await database.get(auth.currentUser!.uid);
    setState(() {
      rider = _rider;
    });
  }

  @override
  void initState() {
    if (auth.currentUser == null)
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.route, (route) => true);
    _fetchRider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (rider == null) {
      return Scaffold(
        body: Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Uber Clone.'),
        actions: [
          IconButton(
              onPressed: () => _signOut(context), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text('useName :${rider!.name}'),
            SizedBox(
              height: 20,
            ),
            Text('email :${rider!.email}'),
            SizedBox(
              height: 20,
            ),
            Text('userPhone :${rider!.phone}'),
            SizedBox(
              height: 20,
            ),
            Text('uid :${rider!.uid}'),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text('to Map Page.'),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MapPage();
              })),
            )
          ],
        ),
      ),
    );
  }
}
