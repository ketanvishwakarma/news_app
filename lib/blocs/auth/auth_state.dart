part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;
}
