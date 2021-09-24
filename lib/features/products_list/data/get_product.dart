import 'package:baguette_app/features/products_list/data/product_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
