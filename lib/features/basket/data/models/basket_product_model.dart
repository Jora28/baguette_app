import 'package:baguette_app/features/basket/domain/product.dart';

class BasketProductModel extends Product {
  String ownerId;
  BasketProductModel(
      {required String id,
      required String category,
      required String image,
      required String name,
      required int count,
      required int price,
      required this.ownerId})
      : super(
            id: id,
            category: category,
            price: price,
            count: count,
            image: image,
            name: name);
  factory BasketProductModel.fromJson(dynamic json) {
    return BasketProductModel(
      id: json['id'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      count: json['count'] as int,
      price: json['price'] as int,
      ownerId: json['ownerId'] as String,
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
    data['ownerId'] = ownerId;

    return data;
  }
}
