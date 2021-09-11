part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class DeleteFrombasketEvent extends BasketEvent {
  final BasketServise basketServise;
  final String productId;

  const DeleteFrombasketEvent({
    required this.basketServise,
    required this.productId,
  });

  @override
  List<Object> get props => [basketServise, productId];
}

class GetproductsFromBasket extends BasketEvent {
  final BasketServise basketServise;
  final String id;

  const GetproductsFromBasket({
    required this.basketServise,
    required this.id,
  });
  @override
  List<Object> get props => [basketServise, id];
}

class AddOrder extends BasketEvent {
  final OrderModel orderModel;
  final BasketServise basketServise;

  const AddOrder({
    required this.orderModel,
    required this.basketServise,
  });

  @override
  List<Object> get props => [orderModel];
}
