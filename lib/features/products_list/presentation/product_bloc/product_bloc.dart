import 'dart:async';

import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/products_list/data/get_product.dart';
import 'package:baguette_app/features/products_list/data/product_model.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProducts) {
      yield ProductsLoading();
      final List<ProductModel> listProducts =
          await event.getProductsServise.getProducts(event.id);
      yield ProductsLoaded(listProducts: listProducts);
    } else if (event is UpDateBasket) {
      event.addProductsToBasketServise.upDateBasket(event.productModel);
    }
  }
}
