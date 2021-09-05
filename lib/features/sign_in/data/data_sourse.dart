import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInServise {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<bool> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential res = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password));
    if (res.user == null) {
      throw FirebaseException;
    } else {
      return res.user != null;
    }
  }
}
