import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'package:uber_clone/helpers/custom_alert_dialog.dart';
import 'package:uber_clone/services/auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static const String route = '/signup';

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

  void _signUp(BuildContext context) async {
    final auth = Auth();
    if (_inputValid(context: context)) {
      final user = await auth.createUser(email, password);
      if (!user.emailVerified) {
        user.sendEmailVerification();
        showAlertDialog(
            context: context,
            title: Text('メールの認証'),
            content: Text('登録したアドレス宛にメールアドレス認証用URLを送信しました。確認をお願いします。'),
            okAction: () => _popLoginPage(context));
      }
    } else {
      print('input valid is return false...');
    }
  }

  bool _inputValid({required BuildContext context}) {
    if (!email.contains('@')) {
      message(context: context, msg: 'メールアドレスの形式が無効です。');
      return false;
    } else if (email.length < 7) {
      showAlertDialog(
          context: context, title: null, content: Text('メールアドレスが短すぎます。'));
    } else if (email.length > 25) {
      message(context: context, msg: 'メールアドレスが長すぎます。');
      return false;
    } else if (password.isEmpty) {
      message(context: context, msg: 'パスワードが入力されていません。');
      return false;
    } else if (password.length > 15) {
      message(context: context, msg: 'パスワードが長すぎます。');
      return false;
    } else if (userName.length > 20) {
      message(context: context, msg: 'ユーザー名が長すぎます。');
      return false;
    } else if (phoneNumber.isEmpty) {
      message(context: context, msg: '電話番号が入力されていません。');
      return false;
    } else if (phoneNumber.length > 15) {
      message(context: context, msg: '電話番号が長すぎます。');
      return false;
    } else {
      return true;
    }
    return false;
  }

  void _popLoginPage(BuildContext context) {
    Navigator.pop(context);
  }

  void message({String msg = "", required BuildContext context}) {
    showAlertDialog(context: context, title: null, content: Text(msg));
  }

  void _showVerificationAlert(BuildContext context) {
    showAlertDialog(
      context: context,
      title: Text('アカウント情報の確認'),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'UserName: '),
                  TextSpan(
                    text: userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Email: '),
                  TextSpan(
                    text: email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'phone: '),
                  TextSpan(
                    text: phoneNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
          onPressed: () => _signUp(context),
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
