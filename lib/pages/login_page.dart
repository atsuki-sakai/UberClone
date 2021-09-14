import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'package:uber_clone/componets/status_bar_Style.dart';
import 'package:uber_clone/pages/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void _login() {
    //TODO - Login Function
    print('login');
  }
  void _pushSignInPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpPage();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return StatusBarStyle(
      brightness: Brightness.light,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 32.0,
              ),
              child: Center(child: _buildContent(context)),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.0),
        ShadowText(
          title: 'Login Page',
          shadow: [
            Shadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 10)
          ],
        ),
        SizedBox(height: 80.0),
        RoundTextField(hintText: 'email@sample.com', labelText: 'Email'),
        SizedBox(height: 20.0),
        RoundTextField(hintText: 'password', labelText: 'Password'),
        SizedBox(height: 80.0),
        DefaultButton(
          title: 'Login',
          color: Colors.indigoAccent,
          onPressed: _login,
        ),
        SizedBox(height: 50.0),
        TextButton(onPressed: () => _pushSignInPage(context), child: Text("まだアカウントをお持ちでないですか？"),),
        SizedBox(height: 100.0),
      ],
    );
  }
}
