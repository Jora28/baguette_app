import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/features/basket/presentation/pages/basket_page.dart';
import 'package:baguette_app/features/categories/presentation/pages/category_page.dart';
import 'package:baguette_app/features/home/presentation/pages/home_page.dart';
import 'package:baguette_app/features/basket/presentation/pages/products_page.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:baguette_app/features/sign_up/presentation/pages/sign_up_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
      page: AllProductPage,
      //transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
  CustomRoute(
      page: SignInPage,
      initial: true,
      //transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
  CustomRoute(
      page: SignUpPage,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
  CustomRoute(
      page: HomePage,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
  CustomRoute(
      page: ProductPage,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
  CustomRoute(
      page: BasketPage,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500),
])
class $FlutterRouter {}
