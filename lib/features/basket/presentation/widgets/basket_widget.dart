import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/utils/styles.dart';
import 'package:baguette_app/core/widgets/loading.dart';
import 'package:baguette_app/core/widgets/product_item_in_busket.dart';
import 'package:baguette_app/features/basket/data/models/basket_product_model.dart';
import 'package:baguette_app/features/basket/data/repository/basket_servise.dart';
import 'package:baguette_app/features/basket/data/models/order_model.dart';
import 'package:baguette_app/features/basket/presentation/basket_bloc/basket_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsInBasketWidget extends StatefulWidget {
  bool? navigateFromProductPage;
  final List<BasketProductModel> listBasketProducts;

  ProductsInBasketWidget({
    this.navigateFromProductPage,
    required this.listBasketProducts,
  });

  @override
  _ProductsInBasketWidgetState createState() => _ProductsInBasketWidgetState();
}

class _ProductsInBasketWidgetState extends State<ProductsInBasketWidget> {
  bool isLoading = false;
  int allPrice = 0;

  late BasketBloc basketBloc;
  final BasketServise basketServise = BasketServise();

  @override
  void initState() {
    // getAllprice();

    basketBloc = BlocProvider.of<BasketBloc>(context);

    super.initState();
  }

  void getAllprice() {
    allPrice = 0;
    for (var i = 0; i < widget.listBasketProducts.length; i++) {
      setState(() {
        allPrice += widget.listBasketProducts[i].count *
            widget.listBasketProducts[i].price;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    getAllprice();
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: BlocProvider(
            create: (BuildContext context) => basketBloc,
            child: Scaffold(body: _body())),
      ),
    );
  }

  Widget _body() {
    //print(allPrice);
    return Column(children: [
      Expanded(
        flex: 3,
        child: NotificationListener(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.listBasketProducts.length,
              itemBuilder: (context, index) {
                final BasketProductModel product =
                    widget.listBasketProducts[index];
                return ProductItemBasket(
                    onM: product.count == 0
                        ? () {}
                        : () {
                            setState(() {
                              product.count--;
                            });
                            basketServise.upDateProductInBasket(product);
                          },
                    onP: () {
                      setState(() {
                        product.count++;
                      });
                      basketServise.upDateProductInBasket(product);
                    },
                    onSave: () {
                      setState(() {
                        widget.listBasketProducts.removeAt(index);
                      });
                      basketBloc.add(DeleteFrombasketEvent(
                          basketServise: basketServise, productId: product.id));
                    },
                    icon: const Icon(Icons.delete),
                    count: product.count,
                    name: product.name,
                    price: product.price,
                    image: product.image);
              },
            )),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppColors.white,
          boxShadow: Shadows.universal,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Deliver price'),
                    Text("500"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Priсe'),
                    Text(allPrice.toString()),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: widget.listBasketProducts.isEmpty
                    ? null
                    : () {
                        basketBloc.add(AddOrder(
                            basketServise: BasketServise(),
                            orderModel: OrderModel(
                                orderOwnerId:
                                    FirebaseAuth.instance.currentUser!.uid,
                                addres: 'Gyumri',
                                listBasketProductModel:
                                    widget.listBasketProducts,
                                orderPrise: allPrice.toString(),
                                phoneNumber: '+37498966976')));
                      },
                style: ElevatedButton.styleFrom(
                    primary: AppColors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Deliver"),
                        Text('${allPrice + 500}'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: Shadows.appBar,
          color: AppColors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: widget.navigateFromProductPage!,
              child: SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Basket",
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
