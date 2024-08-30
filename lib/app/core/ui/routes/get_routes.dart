import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GetRoutes {
  GetRoutes._();

  static const String initial = '/';
  static const String onboardingPage = '/onboardingPage';
  // static const String productDetail = '/productDetail';
  static const String loginPage = '/auth/login';
  static const String registerPage = '/auth/register';
  static const String signUpPage = '/signUpPage';
  static const String signInPage = '/signInPage';
  // static const String homePage = '/homepage';

  // static Widget get page => MultiProvider(
  //       providers: [
  //         Provider<ProductsRepository>(
  //           create: (context) => ProductsRepositoryImpl(
  //             dio: context.read(),
  //           ),
  //         ),
  //         Provider(
  //           create: (context) => HomeController(context.read()),
  //         ),
  //       ],
  //       child: const HomePage(),
  //     );

  // static Widget get productsDetailPage => MultiProvider(
  //       providers: [
  //         Provider(
  //           create: (context) => ProductDetailController(),
  //         ),
  //       ],
  //       builder: (context, child) {
  //         final args = ModalRoute.of(context)!.settings.arguments
  //             as Map<String, dynamic>;

  //         return ProductDetailPage(
  //           product: args['product'],
  //           order: args['order'],
  //         );
  //       },
  //     );
}
