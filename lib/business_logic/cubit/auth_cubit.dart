import 'dart:async';
import 'package:biblioteczka/data/Models/user_model.dart';
import 'package:biblioteczka/data/Repositories/authentication_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository})
      : super(authRepository.currentUser != null
            ? AuthState(authState: AuthStatus.authenticated)
            : AuthState(authState: AuthStatus.unauthenticated)) {
    userSubscription = authRepository.user.listen((user) async {
      if (user != null) {
        //It should not be a solve in this way. The user is created at login as empty despite having data.
        await Future.delayed(const Duration(milliseconds: 100));
        createUserFromFirebaseAuth(user);
        emit(state.copyWith(authState: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(authState: AuthStatus.unauthenticated));
      }
    });
  }

  final AuthenticationRepository authRepository;
  late final StreamSubscription<User?> userSubscription;
  final Logger _logger = Logger();

  String get userStr => authRepository.currentUser.toString();

  //Creat user object from firebase Auth
  void createUserFromFirebaseAuth(User user) {
    _logger.v("User succesfully created: ${user.displayName.toString()}");
    final userApp = UserApp(
        id: user.uid,
        name: user.displayName!,
        email: user.email!,
        photo: user.photoURL ?? Utils.basicUrlUser);
    emit(state.copyWith(user: userApp));
  }

  // Method to login with email and password
  void loginWithEmailPassword(String email, String password) async {
    try {
      emit(state.copyWith(authState: AuthStatus.loading));
      await authRepository.signInWithEmailPassword(
          email: email, password: password);
      _logger.v('Logged with email: ${authRepository.currentUser!.email}');
      emit(AuthState(authState: AuthStatus.authenticated));
    } on FirebaseAuthException catch (e) {
      _logger.e(e.code);
      emit(AuthState(
          authState: AuthStatus.unauthenticated,
          errorMessage: e.message ?? 'Brak'));
    }
  }

  // Creat account with login and password than login
  void createAccountLoginPassword(String email, String password) async {
    try {
      emit(state.copyWith(authState: AuthStatus.loading));
      await authRepository.createAccountEmailPassword(
          email: email, password: password);
      loginWithEmailPassword(email, password);
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(AuthState(
          authState: AuthStatus.unauthenticated,
          errorMessage: e.message ?? 'Brak'));
    }
  }

  // Update name of user
  Future<void> updateUserName(String name) async {
    try {
      await authRepository.updateCurrentUserName(name: name);
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Update user email address

  Future<void> updateUserEmailAddress(String newEmail) async {
    try {
      await authRepository.changeEmailAddress(newEmail: newEmail);
      _logger.v('Changed user mail for $newEmail');
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Update user photo URL
  Future<void> updateUserPhotoUrl(String url) async {
    try {
      await authRepository.updatePhotoUrl(urlP: url);
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(state.copyWith(errorMessage: e.message));
    }
  }
  // Update user password

  Future<void> updateUserPassword(String password) async {
    try {
      await authRepository.changeUserPassword(password: password);
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Reset password by email method
  Future<void> resetPasswordEmail(String email) async {
    try {
      emit(state.copyWith(authState: AuthStatus.loading));
      await authRepository.resetPassword(email: email);
      emit(state.copyWith(
          authState: AuthStatus.unauthenticated,
          errorMessage: 'Wiadomość z prośbą o zresetowanie hasła wysłana.'));
    } on FirebaseAuthException catch (e) {
      _logger.e(e.code);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Method to sing out from account
  void signOut() async {
    try {
      await authRepository.signOut();
      _logger.v('User logged out');
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Method to delete user account
  void deleteUser() async {
    try {
      await authRepository.deleteUser();
      _logger.v('User deleted');
      emit(state.copyWith(authState: AuthStatus.unauthenticated));
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Method to close stream on dipose
  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
