import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Get user stream
  Stream<User?> get user => _auth.userChanges();

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

  // Update user name
  Future<void> updateCurrentUserName({required String name}) async {
    await _auth.currentUser!.updateDisplayName(name);
  }

  // Change email addres
  Future<void> changeEmailAddress({required String newEmail}) async {
    await _auth.currentUser!.updateEmail(newEmail);
  }

  // Update user photo url
  Future<void> updatePhotoUrl({required String urlP}) async {
    await _auth.currentUser!.updatePhotoURL(urlP);
  }

  //Update user email
  Future<void> sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  // Reload
  Future<void> reloadUserData() async {
    await _auth.currentUser!.reload();
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Delete account
  Future<void> deleteUser() async {
    await _auth.currentUser!.delete();
  }
}
