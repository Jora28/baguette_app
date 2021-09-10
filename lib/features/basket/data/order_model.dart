import 'package:baguette_app/features/basket/domain/order.dart';
import 'package:baguette_app/features/products/data/basket_product_model.dart';

class OrderModel extends Order {
  const OrderModel({
    required List<BasketProductModel> listBasketProductModel,
    required String orderPrise,
    required String addres,
    required String phoneNumber,
  }) : super(
          listBasketProductModel: listBasketProductModel,
          orderPrise: orderPrise,
          addres: addres,
          phoneNumber: phoneNumber,
        );

  factory OrderModel.fromJson(json) {
    return OrderModel(
      addres: json['addres'] as String,
      listBasketProductModel:
          json['listBasketProductModel'] as List<BasketProductModel>,
      phoneNumber: json['phoneNumber'] as String,
      orderPrise: json['orderPrise'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['addres'] = addres;
    data['listBasketProductModel'] = listBasketProductModel.map((e) => e.toJson()).toList();
    data['phoneNumber'] = phoneNumber;
    data['orderPrise'] = orderPrise;

    return data;
  }
}
