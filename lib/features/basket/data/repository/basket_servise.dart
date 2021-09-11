import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BasketServise {
  final store = FirebaseFirestore.instance;
  Future<void> deleteProductFromBasket({required String id}) async {
     await store.collection('basket').doc(FirebaseAuth.instance.currentUser!.uid).delete();
  }

  Future<List<BasketProductModel>> getBasketProducts(String id) async {
    final res =
        await store.collection('basket').where('ownerId', isEqualTo: id).get();
    final doc = res.docs.map((element) {
      return BasketProductModel.fromJson(element.data());
    }).toList();
    // print(doc);
    return doc;
  }

  Future<void> addOrder(OrderModel orderModel) async {
    try {
       await store
          .collection('orders')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(orderModel.toJson());

    } catch (e) {
      print(e.toString());
    }
  }
}
