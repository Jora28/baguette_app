import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/product.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/data/models/product_model.dart';
import 'package:baguette_app/features/basket/presentation/product_bloc/product_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductsWidget extends StatefulWidget {
  final List<ProductModel> productList;
  final bool? basketBeckArrowVisible;
  const ProductsWidget(
      {required this.productList, this.basketBeckArrowVisible});

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late ProductBloc productBloc;
  void _onSave(int index) {
    productBloc = BlocProvider.of(context);
    productBloc.add(UpDateBasket(
      addProductsToBasketServise: BasketServise(),
      productModel: widget.productList[index],
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(body: _body()),
          ),
        ),
      ],
    );
  }

  Widget _appBar() {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Container(
              child: Text(
            widget.productList.isNotEmpty
                ? "${widget.productList[0].category[0].toUpperCase()}${widget.productList[0].category.substring(1)}"
                : "",
            style: const TextStyle(fontSize: 18),
          )),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                context.router
                    .push(BasketPageRoute(basketBackArrowVisible: true));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _appBar(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: AppColors.white),
            child: ListView.builder(
                itemCount: widget.productList.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 300,
                      child: ProductItem(
                        onM: widget.productList[index].count == 0
                            ? () {}
                            : () {
                                setState(() {
                                  widget.productList[index].count--;
                                });
                              },
                        onP: () {
                          setState(() {
                            widget.productList[index].count++;
                            //print(widget.productList[index].count);
                          });
                        },
                        count: widget.productList[index].count,
                        name: widget.productList[index].name,
                        price: widget.productList[index].price,
                        image: widget.productList[index].image,
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: AppColors.white,
                        ),
                        onSave: () {
                          _onSave(index);
                        },
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
