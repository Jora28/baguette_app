import 'package:baguette_app/features/categories/data/category_model.dart';
import 'package:baguette_app/features/categories/data/get_customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCategorySevise {
  Future<List<CategoryModel>> getCategories() async {
    final res = await FirebaseFirestore.instance.collection("category").get();
    final doc = res.docs.map((element) {
      return CategoryModel.fromJson(element.data());
    }).toList();

    return doc;
  }
}

class GetCustomerServise {
  final store = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<GetCustomerModel> getUserData() async {
    final res = await store
        .collection("usersPath")
        .doc(_firebaseAuth.currentUser!.uid)
        .get();
    return GetCustomerModel.fromJson(res.data());
  }
}
