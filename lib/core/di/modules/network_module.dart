import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
