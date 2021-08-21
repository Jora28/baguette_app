import 'package:auto_route/auto_route.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/all_prodpage.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/sign_in_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  CustomRoute(
      page: AllProductPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
  CustomRoute(
      page: SignInPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 1000),
])
class $FlutterRouter {}
