import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/show_toast.dart';
import 'package:baguette_app/core/widgets/toast.dart';
import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/presentation/basket_bloc/basket_bloc.dart';

import 'package:baguette_app/features/basket/presentation/widgets/basket_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPage extends StatefulWidget {
  final bool? basketBackArrowVisible;
  const BasketPage({Key? key, this.basketBackArrowVisible}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late BasketBloc basketBloc;

  @override
  void initState() {
    basketBloc = BasketBloc();
    basketBloc.add(GetproductsFromBasket(
      basketServise: BasketServise(),
      id: FirebaseAuth.instance.currentUser!.uid,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<BasketBloc>(
        create: (context) {
          return basketBloc;
        },
        child: BlocConsumer<BasketBloc, BasketState>(
          listener: (context, state) {
            if (state is OrderSended) {
              showToast(
                  context: context,
                  text: 'The Deliver have been done',
                  toastGravity: ToastGravity.CENTER);
            }
          },
          builder: (BuildContext context, state) {
            return Stack(
              children: [
                if (state is BasketProductsLoading)
                  const LoadingWidget()
                else if (state is BasketProductsLoaded)
                  StreamBuilder<List<BasketProductModel>>(
                    stream: basketBloc.behaviorSubject,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return ProductsInBasketWidget(
                            navigateFromProductPage:
                                widget.basketBackArrowVisible,
                            listBasketProducts: snapshot.data!,
                          );
                        case ConnectionState.waiting:
                          return const LoadingWidget();
                        case ConnectionState.active:
                          return ProductsInBasketWidget(
                            navigateFromProductPage:
                                widget.basketBackArrowVisible,
                            listBasketProducts: snapshot.data!,
                          );

                        case ConnectionState.none:
                          return Container();
                      }
                    },
                  ),
                if (state is OrderSended)
                  ProductsInBasketWidget(
                    navigateFromProductPage: widget.basketBackArrowVisible,
                    listBasketProducts: [],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
