// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState {
  final AuthStatus authState;
  final String errorMessage;

  AuthState({required this.authState, this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authState,
    String? errorMessage,
  }) {
    return AuthState(
      authState: authState ?? this.authState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
