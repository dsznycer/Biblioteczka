import 'dart:async';
import 'package:biblioteczka/data/Models/user_model.dart';
import 'package:biblioteczka/data/Repositories/authentication_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository})
      : super(authRepository.currentUser != null
            ? AuthState(authState: AuthStatus.authenticated)
            : AuthState(authState: AuthStatus.unauthenticated)) {
    userSubscription = authRepository.user.listen((user) {
      if (user != null) {
        creatUserFromFirebase(user);
        emit(state.copyWith(authState: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(authState: AuthStatus.unauthenticated));
      }
    });
  }

  final AuthenticationRepository authRepository;
  late final StreamSubscription<User?> userSubscription;

  String get userStr {
    return authRepository.currentUser.toString();
  }

  //Creat user object from firebase
  void creatUserFromFirebase(User user) {
    // final user = authRepository.currentUser;
    final userApp = UserApp(
        id: user.uid ?? '',
        name: user.displayName ?? 'brak',
        email: user.email ?? 'brak',
        photo: user.photoURL ?? Utils.basicUrlUser);
    emit(state.copyWith(user: userApp));
  }

  // Method to login with email and password
  void loginWithEmailPassword(String email, String password) async {
    try {
      emit(state.copyWith(authState: AuthStatus.loading));
      await authRepository.signInWithEmailPassword(
          email: email, password: password);
      print('Logged with email: ${authRepository.currentUser!.email}');
      emit(AuthState(authState: AuthStatus.authenticated));
    } on FirebaseAuthException catch (e) {
      print(e.code);
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
      print(e.code);
      emit(AuthState(
          authState: AuthStatus.unauthenticated,
          errorMessage: e.message ?? 'Brak'));
    }
  }

  // Update name of user
  void updateUserName(String name) async {
    try {
      await authRepository.updateCurrentUserName(name: name);
      authRepository.reloadUserData();
      creatUserFromFirebase(authRepository.currentUser!);
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Reset password by email method
  Future<void> resetPasswordEmail(String email) async {
    try {
      emit(state.copyWith(authState: AuthStatus.loading));
      await authRepository.resetPassword(email: email);
      emit(state.copyWith(authState: AuthStatus.unauthenticated));
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Method to sing out from account
  void signOut() async {
    try {
      await authRepository.signOut();
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  // Method to delete user account
  void deleteUser() async {
    try {
      await authRepository.deleteUser();
      emit(state.copyWith(authState: AuthStatus.unauthenticated));
    } on FirebaseAuthException catch (e) {
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
