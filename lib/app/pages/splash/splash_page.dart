import 'package:delivery_ka/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Splash Page'),
      // ),
      body: ColoredBox(
        color: DeliveryKaColors.blackSplash,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/brigadeiros_logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.10),
                  ),
                  Image.asset('assets/images/logo_ka.png'),
                  SizedBox(
                    height: context.percentHeight(.035),
                  ),
                  DeliveryKaButton(
                    width: context.percentWidth(.60),
                    height: 40,
                    label: 'ACESSAR',
                    color: DeliveryKaColors.whiteColor,
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/homePage');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
