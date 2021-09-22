import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'package:uber_clone/helpers/custom_alert_dialog.dart';
import 'package:uber_clone/helpers/toast.dart';
import 'package:uber_clone/services/auth.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static const String route = '/signup';

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signUp(BuildContext context) async {
    final _auth = Auth();
    if (_inputValid(context)) {
      try {
        final user = await _auth.createUser(email: emailController.text, password: passwordController.text);
        if (user == null) {
          toast(context: context, msg: '予期せぬエラーが発生しました。再度登録お願いします。');
        } else {
          if (!user.emailVerified) {
            user.sendEmailVerification();
            await showAlertDialog(
              context: context,
              title: Text('メールの認証'),
              content: Text('登録したアドレス宛にメールアドレス認証用URLを送信しました。確認をお願いします。'),
              defaultActionText: 'OK',
              action: () => _popLoginPage(context),
            );
          }
        }
      } on FirebaseException catch (error) {
        toast(context: context, msg: error.message!);
      }
    }
  }

  bool _inputValid(BuildContext context) {
    if (!emailController.text.contains('@')) {
      toast(context: context, msg: 'メールアドレスの形式が無効です。');
      return false;
    } else if (emailController.text.length < 7) {
      toast(context: context, msg: 'メールアドレスが短すぎます。');
    } else if (emailController.text.length > 25) {
      toast(context: context, msg: 'メールアドレスが長すぎます。');
      return false;
    } else if (passwordController.text.isEmpty) {
      toast(context: context, msg: 'パスワードが入力されていません。');
      return false;
    } else if (passwordController.text.length > 15) {
      toast(context: context, msg: 'パスワードが長すぎます。');
      return false;
    } else if (userNameController.text.length > 20) {
      toast(context: context, msg: 'ユーザー名が長すぎます。');
      return false;
    } else if (phoneNumberController.text.isEmpty) {
      toast(context: context, msg: '電話番号が入力されていません。');
      return false;
    } else if (phoneNumberController.text.length > 15) {
      toast(context: context, msg: '電話番号が長すぎます。');
      return false;
    } else {
      return true;
    }
    return false;
  }

  void _popLoginPage(BuildContext context) {
    final _data = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    Navigator.pop(context, _data);
  }

  Future<void> _showVerificationAlert(BuildContext context) async =>
      showAlertDialog(
          context: context,
          title: Text('アカウント情報の確認'),
          content: Padding(
            padding: EdgeInsets.symmetric(
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
                        text: userNameController.text,
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
                        text: emailController.text,
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
                        text: phoneNumberController.text,
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
          defaultActionText: 'OK');

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
          controller: userNameController,
        ),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(
          hintText: 'sample@email.com',
          labelText: 'Email',
          focusNode: emailFocusNode,
          nextFocus: phoneNumberFocusNode,
          controller: emailController,
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
          controller: phoneNumberController,
        ),
        SizedBox(
          height: 20.0,
        ),
        RoundTextField(
          obscureText: true,
          hintText: 'password',
          labelText: 'Password',
          focusNode: passwordFocusNode,
          controller: passwordController,
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
