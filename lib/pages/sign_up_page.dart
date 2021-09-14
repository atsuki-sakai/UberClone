import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  String userName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  void changeUserName(_userName) {
    userName = _userName;
  }

  void changeEmail(_email) {
    email = _email;
  }

  void changePhoneNumber(_phoneNumber) {
    phoneNumber = _phoneNumber;
  }

  void changePassword(_pass) {
    password = _pass;
  }

  void _signUp() {
    //TODO - make SignUp Function
    print('SignUp => userName: ${userName}, email : ${email} , phoneNumber : ${phoneNumber}, pass: ${password}');
  }

  void _popLoginPage(BuildContext context) {
    Navigator.pop(context);
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
        RoundTextField(
          hintText: 'Yamada Tarou',
          labelText: 'UserName',
          nextFocus: emailFocusNode,
          onChanged: (_userName) => changeUserName(_userName),
        ),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(
          hintText: 'sample@email.com',
          labelText: 'Email',
          focusNode: emailFocusNode,
          nextFocus: phoneNumberFocusNode,
          onChanged: (_email) => changeEmail(_email),
        ),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(
          keyBoardType: TextInputType.numberWithOptions(signed: true),
          hintText: '090 1234 5678',
          labelText: 'PhoneNumber',
          focusNode: phoneNumberFocusNode,
          nextFocus: passwordFocusNode,
          onChanged: (_phoneNumber) => changePhoneNumber(_phoneNumber),
        ),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(
          obscureText: true,
          hintText: 'password',
          labelText: 'Password',
          focusNode: passwordFocusNode,
          onChanged: (_pass) => changePassword(_pass),
        ),
        SizedBox(
          height: 80.0,
        ),
        DefaultButton(
          title: 'Sign Up',
          color: Colors.indigoAccent,
          onPressed: _signUp,
        ),
        SizedBox(height: 50.0),
        TextButton(
          onPressed: () => _popLoginPage(context),
          child: Text("既にアカウントをお持ちですか？"),
        ),
        SizedBox(height: 100.0)
      ],
    );
  }
}
