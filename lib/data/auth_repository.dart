import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  AuthRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
