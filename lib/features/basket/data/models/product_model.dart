import 'package:baguette_app/features/basket/domain/product.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String category,
    required String image,
    required String name,
    required int count,
    required int price,
  }) : super(
            id: id,
            category: category,
            price: price,
            count: count,
            image: image,
            name: name);
  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      id: json['id'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = name;
    data['id'] = id;
    data['category'] = category;
    data['image'] = image;
    data['price'] = price;
    data['count'] = count;

    return data;
  }
}
