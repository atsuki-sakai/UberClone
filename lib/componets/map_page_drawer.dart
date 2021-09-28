import 'package:flutter/material.dart';
import 'package:uber_clone/componets/circle_button.dart';

class MapPageDrawer extends StatelessWidget {
  const MapPageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 255.0,
      color: Colors.grey.shade50,
      child: Drawer(
        child: ListView(
          children: [
            _buildProfileHeader(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text(
                'History',
                style: TextStyle(fontSize: 15.0),
              ),
              trailing: Icon(Icons.arrow_right, color: Colors.grey,),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Visit Profile',
                style: TextStyle(fontSize: 15.0),
              ),
              trailing: Icon(Icons.arrow_right, color: Colors.grey,),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                style: TextStyle(fontSize: 15.0),
              ),
              trailing: Icon(Icons.arrow_right, color: Colors.grey,),
            ),
            SizedBox(height: 50.0,),
            Center(
              child: CircleButton(
                icon: Icons.close,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildProfileHeader() {
    return Container(
      height: 165.0,
      child: DrawerHeader(
          decoration: BoxDecoration(color: Colors.grey.shade50,),
          child: Row(
            children: [
              Image.asset(
                'images/user_icon.png',
                height: 65.0,
                width: 65.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile Name',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Brand_Bold'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Visit Profile'),
                ],
              ),
            ],
          )),
    );
  }
}
