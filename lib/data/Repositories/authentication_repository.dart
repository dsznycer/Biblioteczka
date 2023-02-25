import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Get user stream
  Stream get user {
    return _auth.authStateChanges();
  }

// Login with email and password method
  Future loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final data = _auth.currentUser;
      print(data);
    } catch (e) {
      print(e);
    }
  }

  // Reset password
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
