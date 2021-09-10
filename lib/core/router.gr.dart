// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../features/categories/presentation/pages/category_page.dart' as _i3;
import '../features/home/presentation/pages/home_page.dart' as _i6;
import '../features/products/presentation/pages/products_page.dart' as _i7;
import '../features/sign_in/presentation/pages/sign_in_page.dart' as _i4;
import '../features/sign_up/presentation/pages/sign_up_page.dart' as _i5;

class FlutterRouter extends _i1.RootStackRouter {
  FlutterRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AllProductPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.AllProductPage();
        },
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SignInPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SignInPage();
        },
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    SignUpPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.SignUpPage();
        },
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    HomePageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HomePage();
        },
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false),
    ProductPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.ProductPage();
        },
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AllProductPageRoute.name, path: '/all-product-page'),
        _i1.RouteConfig(SignInPageRoute.name, path: '/'),
        _i1.RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        _i1.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i1.RouteConfig(ProductPageRoute.name, path: '/product-page')
      ];
}

class AllProductPageRoute extends _i1.PageRouteInfo {
  const AllProductPageRoute() : super(name, path: '/all-product-page');

  static const String name = 'AllProductPageRoute';
}

class SignInPageRoute extends _i1.PageRouteInfo {
  const SignInPageRoute() : super(name, path: '/');

  static const String name = 'SignInPageRoute';
}

class SignUpPageRoute extends _i1.PageRouteInfo {
  const SignUpPageRoute() : super(name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

class ProductPageRoute extends _i1.PageRouteInfo {
  const ProductPageRoute() : super(name, path: '/product-page');

  static const String name = 'ProductPageRoute';
}
