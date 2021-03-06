part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketInitial extends BasketState {}

class BasketProductsLoading extends BasketState {}

class BasketProductsLoaded extends BasketState {}

class OrderSended extends BasketState {}
