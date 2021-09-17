import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<User> createUser(String email, String password);
  Stream<User?> authStateChanges();
}

class Auth implements BaseAuth {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<User> createUser(String email, String password) async {
    final UserCredential _userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = _userCredential.user;
    if (user == null) throw Exception('create user is null.');
    return user;
  }
}
