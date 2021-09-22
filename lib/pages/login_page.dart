import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/componets/default_button.dart';
import 'package:uber_clone/componets/round_text_field.dart';
import 'package:uber_clone/componets/shadow_text.dart';
import 'package:uber_clone/helpers/custom_alert_dialog.dart';
import 'package:uber_clone/helpers/toast.dart';
import 'package:uber_clone/models/rider.dart';
import 'package:uber_clone/pages/sign_up_page.dart';
import 'package:uber_clone/services/auth.dart';
import 'package:uber_clone/utils/custom_exception.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

  final passwordFocusNode = FocusNode();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    if (_inputValid(context: context)) {
      final _auth = Auth();
      try {
        final _user = await _auth.signInWithEmailAndPassword(
            email: emailTextController.text.trim(),
            password: passwordTextController.text.trim());
        if (_user == null)
          return toast(context: context, msg: UnknowException.message);
        if (!_user.emailVerified)
          return toast(context: context, msg: LoginEmailValidException.message);
        Navigator.pushNamed(context, HomePage.route);
      } on FirebaseException catch (error) {
        toast(context: context, msg: error.message!);
      }
    }
  }

  bool _inputValid({required BuildContext context}) {
    if (!emailTextController.text.contains('@')) {
      toast(context: context, msg: 'メールアドレスの形式が無効です。');
      return false;
    } else if (emailTextController.text.length < 7) {
      toast(context: context, msg: 'メールアドレスが短すぎます。');
    } else if (emailTextController.text.length > 25) {
      toast(context: context, msg: 'メールアドレスが長すぎます。');
      return false;
    } else if (passwordTextController.text.isEmpty) {
      toast(context: context, msg: 'パスワードが入力されていません。');
      return false;
    } else if (passwordTextController.text.length > 15) {
      toast(context: context, msg: 'パスワードが長すぎます。');
      return false;
    }
    return true;
  }

  Future<void> _pushSignUpPage(BuildContext context) async {
    final _rider = await Navigator.pushNamed(context, SignUpPage.route) as Rider?;
    if(_rider == null) return;
    // FIXME - rider.emailがnullであればクラッシュする。用途を限定すべき。
    emailTextController.text = _rider.email;
    passwordTextController.text = '';
    await showAlertDialog(context: context, title: SizedBox(), content: Text('認証メールを確認後ログインして下さい。'), defaultActionText: '了解');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
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
            Shadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 10),
          ],
        ),
        SizedBox(height: 80.0),
        RoundTextField(
          hintText: 'email@sample.com',
          labelText: 'Email',
          nextFocus: passwordFocusNode,
          controller: emailTextController,
        ),
        SizedBox(height: 20.0),
        RoundTextField(
          obscureText: true,
          hintText: 'password',
          labelText: 'Password',
          focusNode: passwordFocusNode,
          controller: passwordTextController,
        ),
        SizedBox(height: 80.0),
        DefaultButton(
          title: 'Login',
          color: Colors.indigoAccent,
          onPressed: () => _login(context),
        ),
        SizedBox(height: 50.0),
        TextButton(
          onPressed: () => _pushSignUpPage(context),
          child: Text("まだアカウントをお持ちでないですか？"),
        ),
        SizedBox(height: 100.0),
      ],
    );
  }
}
