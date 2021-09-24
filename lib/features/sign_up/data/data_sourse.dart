import 'package:baguette_app/features/base_models/custumer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServise {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<bool> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (res.user == null) {
      throw FirebaseException;
    } else {
      return res.user != null;
    }
  }

  Future upDateUser({required CustomerModel model}) async {
    model.id = _firebaseAuth.currentUser!.uid;

    await store
        .collection('usersPath')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(model.toJson());
  }
}
