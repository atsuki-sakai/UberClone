import 'package:firebase_auth/firebase_auth.dart';

class LoginEmailValidException implements Exception {
  const LoginEmailValidException();

  static const String code = '認証待ちエラー';
  static const String message = '登録したアドレス宛にメールを送信しています。確認の上、再度ログインしてください。';
}

class CustomException implements Exception {
  const CustomException({required this.code, required this.message});

  final code;
  final message;
}

class InputValidException {
  String code = '';
  String message = '';

  static InputValidException transformJPLanguage(
      {required FirebaseException e}) {
    switch (e.code) {
      case 'wrong-password':
        final exception = InputValidException();
        exception.code = '無効なパスワード';
        exception.message = 'パスワードが短すぎるか、ユーザーがパスワードを持っていません。';
        return exception;
      case 'invalid-email':
        final exception = InputValidException();
        exception.code = '無効なメールアドレス';
        exception.message = 'メールアドレスの形式が正しくありません。';
        return exception;
      case 'weak-password':
        final exception = InputValidException();
        exception.code = '無効なパスワード';
        exception.message = 'パスワードが無効であるか、入力形式が正しくありません。';
        return exception;
      case 'user-not-found':
        final exception = InputValidException();
        exception.code = 'ユーザーが見つかりません';
        exception.message = 'このメールアドレスに対応する、ユーザーは存在しません。 ユーザーが削除された可能性があります。';
        return exception;
      case 'email-already-in-use':
        final exception = InputValidException();
        exception.code = '使用中のメールアドレス';
        exception.message = 'メールアドレスはすでに別のアカウントで使用されています。';
        return exception;
      case 'missing-email':
        final exception = InputValidException();
        exception.code = 'メールアドレスが空です';
        exception.message = 'メールアドレスを入力する必要があります。';
        return exception;
      default:
        final exception = InputValidException();
        exception.code = e.code;
        exception.message = e.message ?? 'No Message';
        return exception;
    }
  }
}
