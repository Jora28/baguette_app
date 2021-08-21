import 'package:baguette_app/features/sign_in/data/Customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServise {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<bool> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential res = (await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password));
      if (res.user != null) {
        print(res.user!.email);
      } else {
        print("errroe");
      }
      return res.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
