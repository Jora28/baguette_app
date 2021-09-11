import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/presentation/basket_bloc/basket_bloc.dart';

import 'package:baguette_app/features/basket/presentation/widgets/basket_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPage extends StatefulWidget {
  final bool? basketBackArrowVisible;
  const BasketPage({Key? key,this.basketBackArrowVisible}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late BasketBloc basketBloc;
  @override
  void initState() {
    basketBloc = BlocProvider.of(context);
    basketBloc.add(GetproductsFromBasket(
      basketServise: BasketServise(),
      id: FirebaseAuth.instance.currentUser!.uid,
    ));
    FirebaseMessaging.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BasketBloc, BasketState>(
        listener: (context, state) {
          if (state is OrderSended) {
            showToast(context, 'The Deliver have been done');
          }
        },
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              if (state is BasketProductsLoading)
                const LoadingWidget()
              else if (state is BasketProductsLoaded)
                ProductsInBasketWidget(
                  navigateFromProductPage: widget.basketBackArrowVisible,
                  listBasketProducts: state.listBasketProducts,
                ),
              if (state is OrderSended)
                ProductsInBasketWidget(
                  navigateFromProductPage: true,
                  listBasketProducts: [],
                ),
            ],
          );
        },
      ),
    );
  }
}
