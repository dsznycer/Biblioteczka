import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser {
    return _auth.currentUser;
  }

  // Get user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

// Login with email and password method
  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Register account with email and password
  Future<void> createAccountEmailPassword(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Reset password method
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
