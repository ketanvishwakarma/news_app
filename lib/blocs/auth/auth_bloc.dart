// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:news_app/data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(UnAuthenticated()) {
    _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        add(AuthStateChanged(state: Authenticated(user)));
      } else {
        add(AuthStateChanged(state: UnAuthenticated()));
      }
    });
    on<AuthStateChanged>(_onAuthStateChanged);
    on<AuthLogOutRequested>(_onAuthLogOutRequested);
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(event.state);
  }

  FutureOr<void> _onAuthLogOutRequested(
    AuthLogOutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.logout();
  }
}
