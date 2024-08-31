import 'package:flutter/material.dart';

class DeliveryKaAppbar extends AppBar {
  DeliveryKaAppbar({
    super.key,
    double elevation = 1,
  }) : super(
          elevation: elevation,
          title: Image.asset(
            'assets/images/logo_appbar.png',
            width: 70,
          ),
        );
}
