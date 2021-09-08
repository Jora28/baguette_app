import 'package:baguette_app/core/utils/colors.dart';
import 'package:baguette_app/features/all_products/presentation/pages/all_product_page.dart';
import 'package:baguette_app/features/basket/presentation/basket_page.dart';
import 'package:baguette_app/features/information/presentation/info_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _body(),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: AppColors.white,
            items: const [
              Icon(Icons.info, color: AppColors.white),
              Icon(Icons.home, color: AppColors.white),
              Icon(Icons.shopping_cart, color: AppColors.white),
            ],
            index: 1,
            height: 50,
            color: AppColors.blue,
            buttonBackgroundColor: AppColors.blue,
            animationDuration: const Duration(milliseconds: 200),
            animationCurve: Curves.bounceInOut,
            onTap: (int index) {
              setState(() => sectionIndex = index);
            }),
      ),
    );
  }

  Widget _body() {
    switch (sectionIndex) {
      case 1:
        return const AllProductPage();
      case 2:
        return const BasketPage(
            // navigateFromProductPage: false,
            );
      case 0:
        return const InfoPage();
      default:
        return const AllProductPage();
    }
  }
}
