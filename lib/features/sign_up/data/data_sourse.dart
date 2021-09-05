import 'package:baguette_app/features/sign_up/data/custumer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServise {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  Future<bool> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var res = (await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password));
      return res.user != null;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
    Future upDateUser({required CustomerModel model}) async {
    model.id = _firebaseAuth.currentUser!.uid;
    try {
      await store
          .collection('usersPath')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(model.toJson());
      return true;
    } catch (e) {
      print(e.toString());
    }
  }
}
