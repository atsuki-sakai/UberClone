import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  void _signUp() {
    //TODO - make SignUp Function
    print('SignUp');
  }

  void _pushLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 32.0,
            ),
            child: Center(child: _buildContents(context)),
          ),
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.0,
        ),
        ShadowText(
          title: 'Sign Up',
          shadow: [
            Shadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 10)
          ],
        ),
        SizedBox(
          height: 80.0,
        ),
        RoundTextField(hintText: 'Yamada Tarou', labelText: 'UserName'),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(hintText: 'sample@email.com', labelText: 'Email'),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(hintText: '090 1234 5678', labelText: 'PhoneNumber'),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(hintText: 'password', labelText: 'Password'),
        SizedBox(
          height: 80.0,
        ),
        DefaultButton(title: 'Sign Up', onPressed: _signUp),
        SizedBox(height: 50.0),
        TextButton(
          onPressed: () => _pushLoginPage(context),
          child: Text("既にアカウントをお持ちですか？"),
        ),
        SizedBox(height: 100.0)
      ],
    );
  }
}
