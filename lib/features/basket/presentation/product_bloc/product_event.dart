part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductEvent {
  final GetProductsServise getProductsServise;
  final String id;
  const GetProducts({
    required this.id,
    required this.getProductsServise,
  });

  @override
  List<Object> get props => [getProductsServise, id];
}

class UpDateBasket extends ProductEvent {
  final AddProductsToBasketServise addProductsToBasketServise;
  final ProductModel productModel;

  const UpDateBasket({
    required this.productModel,
    required this.addProductsToBasketServise,
  });
  @override
  List<Object> get props => [addProductsToBasketServise, productModel];
}
