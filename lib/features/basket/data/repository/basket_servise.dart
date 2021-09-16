import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:baguette_app/features/basket/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BasketServise {
  // final DataBaseServise  dataBaseServise = DataBaseServise();
  // final AuthServise authServise = AuthServise();

  final store = FirebaseFirestore.instance;
  final CollectionReference basketCollection =
      FirebaseFirestore.instance.collection('basket');
  Future<void> deleteProductFromBasket({required String ownerId}) async {
    print('delet Product');
    basketCollection
        .where('ownerId', isEqualTo: ownerId)
        .get()
        .then((snapshot) {
      for (final DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  Future<void> deleteProductByIdFromBasket({required String productId}) async {
    print('delet Product');
    basketCollection.where('id', isEqualTo: productId).get().then((snapshot) {
      for (final DocumentSnapshot ds in snapshot.docs) {
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

  Stream<List<BasketProductModel>>? getStreamBasketProducts(String id) {
    final res = basketCollection
        .where('ownerId', isEqualTo: id)
        .snapshots()
        .map((event) => event.docs
            .map((e) => BasketProductModel.fromJson(e.data()))
            .toList());
    return res;
  }

  Future<void> addOrder(OrderModel orderModel) async {
    try {
      await store
          .collection('orders')
          .doc(FirebaseAuth.instance.currentUser!.uid +
              DateTime.now().toString())
          .set(orderModel.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future upDateBasket(ProductModel product) async {
    print('upDateBasket');
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

  Future<void> upDateProductInBasket(BasketProductModel product) {
    final String? res = FirebaseAuth.instance.currentUser?.uid;

    return basketCollection
        .where('ownerId', isEqualTo: res)
        .where('id', isEqualTo: product.id)
        .get()
        .then((snapshot) {
      for (final DocumentSnapshot ds in snapshot.docs) {
        ds.reference.update({'count': product.count});
      }
    });
  }
}
