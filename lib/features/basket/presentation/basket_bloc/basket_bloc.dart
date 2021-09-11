import 'dart:async';

import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial());

  @override
  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is DeleteFrombasketEvent) {
      event.basketServise.deleteProductFromBasket(id: event.productId);
    } else if (event is GetproductsFromBasket) {
      yield BasketProductsLoading();
      final List<BasketProductModel> listProductsFromBasket =
          await event.basketServise.getBasketProducts(event.id);
      yield BasketProductsLoaded(listBasketProducts: listProductsFromBasket);
    } else if (event is AddOrder) {
      yield BasketProductsLoading();
      await event.basketServise.addOrder(event.orderModel);
      await event.basketServise
          .deleteProductFromBasket(id: FirebaseAuth.instance.currentUser!.uid);
      yield OrderSended();
    }
  }
}
