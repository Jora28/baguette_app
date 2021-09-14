import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/domain/order.dart';

class OrderModel extends Order {
  const OrderModel(
      {required List<BasketProductModel> listBasketProductModel,
      required String orderPrise,
      required String addres,
      required String phoneNumber,
      required String orderOwnerId})
      : super(
          listBasketProductModel: listBasketProductModel,
          orderPrise: orderPrise,
          addres: addres,
          orderOwnerId: orderOwnerId,
          phoneNumber: phoneNumber,
        );

  factory OrderModel.fromJson(json) {
    return OrderModel(
        addres: json['addres'] as String,
        listBasketProductModel:
            json['listBasketProductModel'] as List<BasketProductModel>,
        phoneNumber: json['phoneNumber'] as String,
        orderPrise: json['orderPrise'] as String,
        orderOwnerId: json['orderOwnerId'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['addres'] = addres;
    data['listBasketProductModel'] =
        listBasketProductModel.map((e) => e.toJson()).toList();
    data['phoneNumber'] = phoneNumber;
    data['orderPrise'] = orderPrise;
    data['orderOwnerId'] = orderOwnerId;

    return data;
  }
}
