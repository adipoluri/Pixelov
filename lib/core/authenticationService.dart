import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();

  Future<User> getCurrentUser(String uid) async {
    DocumentSnapshot userDocument =
        await firestore.collection('users').doc(uid).get();
    if (userDocument != null && userDocument.exists) {
      //return User.fromJson(userDocument.data());
    } else {
      return null;
    }
  }

  //static Future<User> updateCurrentUser(User user) async {
  //  return await firestore
  //      .collection(USERS)
  //      .doc(user.userID)
  //      .set(user.toJson())
  //      .then((document) {
  //    return user;
  //  });
  //}
}
