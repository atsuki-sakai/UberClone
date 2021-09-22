import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/utils/custom_exception.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<User?> createUser({required String email, required String password});

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _auth = FirebaseAuth.instance;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<User?> createUser(
      {required String email, required String password}) async {
    final UserCredential _credential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _credential.user;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential _credential = await _auth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password));

    return _credential.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
