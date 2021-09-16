import 'dart:async';

import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BehaviorSubject<List<BasketProductModel>>? behaviorSubject;

  BasketBloc() : super(BasketInitial()) {
    print("object BasketBloc");
    initBasketProdSubskription();
  }

  void initBasketProdSubskription() {
    behaviorSubject = BehaviorSubject();
  }

  @override
  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is DeleteFrombasketEvent) {
      event.basketServise
          .deleteProductByIdFromBasket(productId: event.productId);
    } else if (event is GetproductsFromBasket) {
      yield BasketProductsLoading();
      event.basketServise.getStreamBasketProducts(event.id)?.listen((event) {
        behaviorSubject?.sink.add(event);
      });

      yield BasketProductsLoaded();
    } else if (event is AddOrder) {
      yield BasketProductsLoading();
      await event.basketServise.addOrder(event.orderModel);
      await event.basketServise.deleteProductFromBasket(
          ownerId: FirebaseAuth.instance.currentUser!.uid);
      yield OrderSended();
    }
  }
}
