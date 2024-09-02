import 'package:flutter/material.dart';

class DeliveryKaTextStyles {
  DeliveryKaTextStyles._();

  String get font => 'mplys1';

  static TextStyle textLight =
      const TextStyle(fontWeight: FontWeight.w300, fontFamily: 'mplus1');

  static TextStyle textRegular =
      const TextStyle(fontWeight: FontWeight.normal, fontFamily: 'mplus1');

  static TextStyle textmedium =
      const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'mplus1');

  static TextStyle textSemiBold =
      const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'mplus1');

  static TextStyle textBold =
      const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'mplus1');

  static TextStyle textExtraBold =
      const TextStyle(fontWeight: FontWeight.w800, fontFamily: 'mplus1');

  static TextStyle textTitle = textExtraBold.copyWith(fontSize: 28);

  static TextStyle textButtonLabel2 = textBold.copyWith(fontSize: 14);
}
