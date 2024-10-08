import 'package:delivery_ka/app/pages/auth/login/login_controller.dart';
import 'package:delivery_ka/app/pages/auth/login/login_page.dart';
import 'package:delivery_ka/app/pages/auth/register/register_controller.dart';
import 'package:delivery_ka/app/pages/auth/register/register_page.dart';
import 'package:delivery_ka/app/pages/home/home_controller.dart';
import 'package:delivery_ka/app/pages/home/home_page.dart';
import 'package:delivery_ka/app/pages/order/order_controller.dart';
import 'package:delivery_ka/app/pages/order/order_page.dart';
import 'package:delivery_ka/app/pages/product_detail/product_detail_controller.dart';
import 'package:delivery_ka/app/pages/product_detail/product_detail_page.dart';
import 'package:delivery_ka/app/repositories/order/order_repository.dart';
import 'package:delivery_ka/app/repositories/order/order_repository_impl.dart';
import 'package:delivery_ka/app/repositories/products/products_repository.dart';
import 'package:delivery_ka/app/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GetRoutes {
  GetRoutes._();

  static const String initial = '/';
  static const String onboardingPage = '/onboardingPage';
  // static const String loginPage = '/auth/login';
  // static const String registerPage = '/auth/register';
  static const String signUpPage = '/signUpPage';
  static const String signInPage = '/signInPage';
  // static const String orderPage = '/orderPage';
  // static const String productDetail = '/productDetail';

  static Widget get homePage => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context
                  .read(), // para buscar as instancias da nossa arvore utilizamos o context
            ),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );

  static Widget get productsDetailPage => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );

  static Widget get registerPage => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              context.read(),
            ),
          ),
        ],
        child: const RegisterPage(),
      );

  static Widget get loginPage => MultiProvider(
        providers: [
          Provider(
            create: (context) => LoginController(
              context.read(),
            ),
          ),
        ],
        child: const LoginPage(),
      );

  static Widget get orderPage => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => OrderController(context.read()),
          ),
        ],
        child: const OrderPage(),
      );
}
