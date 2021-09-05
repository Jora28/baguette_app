import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/features/all_products/presentation/pages/all_product_page.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:baguette_app/features/sign_up/presentation/pages/sign_up_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
      page: AllProductPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 500),
  CustomRoute(
      page: SignInPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 500),
  CustomRoute(
      page: SignUpPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 500),
])
class $FlutterRouter {}
