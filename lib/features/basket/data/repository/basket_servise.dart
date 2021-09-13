import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:baguette_app/features/basket/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BasketServise {
  final store = FirebaseFirestore.instance;
  final CollectionReference basketCollection =
      FirebaseFirestore.instance.collection('basket');
  Future<void> deleteProductFromBasket({required String id}) async {
    basketCollection.where('ownerId', isEqualTo: id).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<List<BasketProductModel>> getBasketProducts(String id) async {
    final res = await basketCollection.where('ownerId', isEqualTo: id).get();
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

  Future upDateBasket(ProductModel product) async {
    final String? res = FirebaseAuth.instance.currentUser?.uid;
    final String docPath = '${res!}+${product.id}';
    final BasketProductModel basketProductModel = BasketProductModel(
        id: product.id,
        category: product.category,
        image: product.image,
        name: product.name,
        count: product.count,
        price: product.price,
        ownerId: res);

    await basketCollection.doc(docPath).set(basketProductModel.toJson());
  }
}
