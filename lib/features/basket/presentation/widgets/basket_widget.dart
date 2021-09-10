import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/core/widgets/product_item_in_busket.dart';
import 'package:baguette_app/features/basket/data/basket_servise.dart';
import 'package:baguette_app/features/products/data/basket_product_model.dart';
import 'package:auto_route/auto_route.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductsInBasketWidget extends StatefulWidget {
  bool navigateFromProductPage = false;

  ProductsInBasketWidget({required this.navigateFromProductPage});

  @override
  _ProductsInBasketWidgetState createState() => _ProductsInBasketWidgetState();
}

class _ProductsInBasketWidgetState extends State<ProductsInBasketWidget> {
  List<int> currentCount = [];
  List<BasketProductModel> isEmptyBasket = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(body: _body()),
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
          child: SizedBox(
              child: FutureBuilder(
            future: BasketServise()
                .getBasketProducts(FirebaseAuth.instance.currentUser!.uid),
            initialData: [],
            builder: (contex, snap) {
              if (snap.connectionState == ConnectionState.none &&
                  snap.hasData == null) {
                print('project snapshot data is: ${snap.data}');
              }
              return Container();
              // ListView.builder(
              //     itemCount: snap.data!.length,
              //     itemBuilder: (context, index) {
              //       BasketProductModel product = snap.data[index];
              //       return ProductItemBasket(
              //           onM: currentCount[index] == 0
              //               ? () {}
              //               : () {
              //                   setState(() {
              //                     currentCount[index]--;
              //                   });
              //                 },
              //           onP: () {
              //             setState(() {
              //               currentCount[index]++;
              //             });
              //           },
              //           onSave: () {
              //             setState(() {
              //               onDelete(product.id);
              //             });
              //           },
              //           icon: Icon(Icons.delete),
              //           count: currentCount[index],
              //           name: product.name,
              //           price: product.price,
              //           image: product.image);
              //     });
            },
          )),
        )
      ],
    );
  }

  // Widget _sideMenu() {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       margin: EdgeInsets.symmetric(vertical: 50),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             margin: EdgeInsets.only(top: 100),
  //             child: Column(
  //               children: [
  //                 Container(
  //                     child: Row(
  //                   children: [
  //                     Container(
  //                         padding: EdgeInsets.all(8),
  //                         child: CircleAvatar(
  //                           backgroundImage: AssetImage("assets/baguette.png"),
  //                         )),
  //                     Container(
  //                         child: Text("Jora",
  //                             style:
  //                                 TextStyle(color: Colors.black, fontSize: 14)))
  //                   ],
  //                 )),
  //                 Container(
  //                     margin: EdgeInsets.only(left: 15, top: 10),
  //                     child: Row(
  //                       children: [
  //                         Container(
  //                             child: Icon(
  //                           Icons.email_outlined,
  //                           color: Colors.black,
  //                           size: 25,
  //                         )),
  //                         Flexible(
  //                           child: Container(
  //                             padding: EdgeInsets.only(left: 8),
  //                             child: Text(
  //                               "user.email",
  //                               style: TextStyle(
  //                                   color: Colors.black, fontSize: 14),
  //                               maxLines: 2,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     )),
  //               ],
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Container(
  //                   child: Column(
  //                 children: [
  //                   InkWell(
  //                     onTap: () {
  //                       // Navigator.of(context)
  //                       //     .push(MaterialPageRoute(builder: (context)=>SettingPage()));
  //                     },
  //                     child: Container(
  //                         margin: EdgeInsets.symmetric(horizontal: 10),
  //                         child: Icon(
  //                           Icons.settings,
  //                           color: Colors.black,
  //                           size: 25,
  //                         )),
  //                   ),
  //                   Text("Settings",
  //                       style: TextStyle(color: Colors.black, fontSize: 14)),
  //                 ],
  //               )),
  //               InkWell(
  //                 // onTap: () async {
  //                 //   var singOut = await BeasyApi().profileServices.singOut();
  //                 //   if (singOut) {
  //                 //     SaveUserData.saveLogged(false);
  //                 //     Navigator.of(context).popAndPushNamed(OnBoard.routeName);
  //                 //   }
  //                 // },
  //                 child: Container(
  //                     child: Column(
  //                   children: [
  //                     Container(
  //                         margin: EdgeInsets.symmetric(horizontal: 10),
  //                         child: Icon(
  //                           Icons.logout,
  //                           color: Colors.black,
  //                           size: 25,
  //                         )),
  //                     Text("Log out",
  //                         style: TextStyle(color: Colors.black, fontSize: 14)),
  //                   ],
  //                 )),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _appBar() {
    return Container(
      height: 60,
      child: Row(
        children: [
          Visibility(
            visible: widget.navigateFromProductPage,
            child: Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.router.pop();
                },
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Basket",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
  }
}
