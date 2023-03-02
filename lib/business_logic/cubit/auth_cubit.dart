import 'dart:async';
import 'package:biblioteczka/data/Repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository})
      : super(authRepository.currentUser != null
            ? AuthState(authState: AuthStatus.authenticated)
            : AuthState(authState: AuthStatus.unauthenticated)) {
    userSubscription = authRepository.user.listen((user) {
      user != null
          ? emit(state.copyWith(authState: AuthStatus.authenticated))
          : emit(state.copyWith(authState: AuthStatus.unauthenticated));
    });
  }

  String get userStr {
    return authRepository.currentUser.toString();
  }

  final AuthenticationRepository authRepository;
  late final StreamSubscription<User?> userSubscription;

  // Method to login with email and password
  void loginWithEmailPassword(String email, String password) async {
    try {
      await authRepository.signInWithEmailPassword(
          email: email, password: password);
      print(authRepository.currentUser!.email);
      emit(state.copyWith(authState: AuthStatus.authenticated));
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

  // Method to sing out from account
  void signOut() async {
    try {
      await authRepository.signOut();
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }

  void stateAuthenticated() =>
      emit(state.copyWith(authState: AuthStatus.authenticated));
  void stateUnauthenticated() =>
      emit(state.copyWith(authState: AuthStatus.unauthenticated));

  // Method to close stream on dipose
  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
