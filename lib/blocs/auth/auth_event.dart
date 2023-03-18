part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStateChanged extends AuthEvent {
  const AuthStateChanged({required this.state});
  final AuthState state;
}

class AuthLogOutRequested extends AuthEvent {
  const AuthLogOutRequested();
}
