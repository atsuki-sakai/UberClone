import 'package:uber_clone/utils/custom_exception.dart';
// TODO - input_validatorsを個別で用意する

abstract class StringValidator {
  Exception? isValid(String value);
}

class EmailValidator implements StringValidator {
  @override
  Exception? isValid(String value) {
    if (!value.contains('@')) {
      return CustomException(code: '入力エラー', message: "メールアドレスの形式が無効です。");
    } else if (value.length < 7) {
      return CustomException(code: '入力エラー', message: "メールアドレスが短すぎます。");
    } else if (value.length > 25) {
      return CustomException(code: '入力エラー', message: "メールアドレスが長すぎます。");
    } else if (value.isEmpty) {
      return CustomException(code: '入力エラー', message: "メールアドレスが空です。");
    }
    return null;
  }
}

class PasswordValidator implements StringValidator {
  @override
  Exception? isValid(String value) {
    if (value.isEmpty) {
      return CustomException(code: '入力エラー', message: "パスワードが空です。");
    } else if (value.length > 15) {
      return CustomException(code: '入力エラー', message: "パスワードが長すぎます。");
    }
    return null;
  }
}
