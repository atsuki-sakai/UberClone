import 'package:flutter/cupertino.dart';
import 'package:uber_clone/helpers/toast.dart';

class LoginFormInputValidator {

  LoginFormInputValidator({required this.context});
  final BuildContext context;

  bool emailValid(String email) {
    if (!email.contains('@')) {
      toast(context: context, msg: 'メールアドレスの形式が無効です。');
      return false;
    } else if (email.length < 7) {
      toast(context: context, msg: 'メールアドレスが短すぎます。');
      return false;
    } else if (email.length > 25) {
      toast(context: context, msg: 'メールアドレスが長すぎます。');
      return false;
    }
    return true;
  }
  
  bool passwordValid(String password) {
    if (password.isEmpty) {
    toast(context: context, msg: 'パスワードが入力されていません。');
    return false;
    } else if (password.length > 15) {
    toast(context: context, msg: 'パスワードが長すぎます。');
    return false;
    }
    return true;
  }

}