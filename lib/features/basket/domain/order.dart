import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final List<BasketProductModel> listBasketProductModel;
  final String orderPrise;
  final String addres;
  final String phoneNumber;
  final String orderOwnerId;

  const Order({
    required this.orderOwnerId,
    required this.listBasketProductModel,
    required this.orderPrise,
    required this.addres,
    required this.phoneNumber,
  });
  @override
  List<Object?> get props =>
      [listBasketProductModel, orderPrise, addres, phoneNumber];
}
