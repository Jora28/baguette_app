import 'package:baguette_app/features/products/data/basket_product_model.dart';
import 'package:baguette_app/features/products/data/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetProductsServise {
  Future<List<ProductModel>> getProducts(String id) async {
    final res = await FirebaseFirestore.instance
        .collection('product')
        .where('category', isEqualTo: id)
        .get();
    final List<ProductModel> listProductModel = res.docs.map((element) {
      return ProductModel.fromJson(element.data());
    }).toList();
    return listProductModel;
  }
}

class AddProductsToBasketServise {
  final CollectionReference basketUser =
      FirebaseFirestore.instance.collection('basket');
  Future upDateBasket(ProductModel product) {
    final String? res = FirebaseAuth.instance.currentUser?.uid;
    final BasketProductModel basketProductModel = BasketProductModel(
        id: product.id,
        category: product.category,
        image: product.image,
        name: product.name,
        count: product.count,
        price: product.price,
        ownerId: res!);

    product.id = res + DateTime.now().toString();
    return basketUser.doc(product.id).set(basketProductModel.toJson());
  }
}
