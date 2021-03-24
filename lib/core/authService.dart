import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<auth.User> get authStateChanges => _firebaseAuth.authStateChanges();
}

Future<void> signOut() async {
  await auth.FirebaseAuth.instance.signOut();
}
