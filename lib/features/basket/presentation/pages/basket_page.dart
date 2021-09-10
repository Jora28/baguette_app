import 'package:baguette_app/features/basket/presentation/bloc/basket_bloc.dart';
import 'package:baguette_app/features/basket/presentation/widgets/basket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late BasketBloc basketBloc;
  @override
  void initState() {
    basketBloc = BlocProvider.of(context);
    basketBloc.add(GetproductsFromBasket());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              ProductsInBasketWidget(navigateFromProductPage: true),
            ],
          );
        },
      ),
    );
  }
}
