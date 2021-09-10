import 'dart:async';

import 'package:baguette_app/features/basket/data/basket_servise.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    }
  }
}
