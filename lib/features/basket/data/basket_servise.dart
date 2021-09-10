import 'package:baguette_app/features/products/data/basket_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BasketServise {
  final store = FirebaseFirestore.instance;
  Future<void> deleteProductFromBasket({required String id}) async {
    return store.collection('basket').doc(id).delete();
  }

  Future<List<BasketProductModel>> getBasketProducts(String id) async {
    final res =
        await store.collection('basket').where('ownerId', isEqualTo: id).get();
    final doc = res.docs.map((element) {
      return BasketProductModel.fromJson(element.data());
    }).toList();
    return doc;
  }
}
