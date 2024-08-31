import 'package:delivery_ka/app/core/provider/application_binding.dart';
import 'package:delivery_ka/app/core/ui/routes/get_routes.dart';
import 'package:delivery_ka/app/core/ui/theme/theme_config.dart';
import 'package:delivery_ka/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class DeliveryKaApp extends StatelessWidget {
  const DeliveryKaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery Ka',
        theme: ThemeConfig.theme,
        routes: {
          GetRoutes.initial: (context) => const SplashPage(),
          '/homePage': (context) => GetRoutes.homePage,
        },
      ),
    );
  }
}
