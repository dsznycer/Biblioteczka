// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated, loading }

class AuthState {
  final AuthStatus authState;
  final String errorMessage;
  final UserApp? user;

  const AuthState({
    required this.authState,
    this.errorMessage = '',
    this.user,
  });

  AuthState copyWith({
    AuthStatus? authState,
    String? errorMessage,
    UserApp? user,
  }) {
    return AuthState(
      authState: authState ?? this.authState,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}
