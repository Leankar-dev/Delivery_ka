import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryKaStyle {
  static DeliveryKaStyle? _instance;

  DeliveryKaStyle._();

  static DeliveryKaStyle get i => _instance ??= DeliveryKaStyle._();

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: DeliveryKaColors.primaryColor,
      textStyle: DeliveryKaTextStyles.textButtonLabel2);
}

extension DeliveryKaStyleEXtensions on BuildContext {
  DeliveryKaStyle get deliveryKaStyles => DeliveryKaStyle.i;
}




// class DeliveryKaStyle {
//   static final DeliveryKaStyle _singleton = DeliveryKaStyle._internal();

//   factory DeliveryKaStyle() {
//     return _singleton;
//   }
  
//   DeliveryKaStyle._internal();

//   static TextStyle get getNormalStyle => TextStyle(
//         color: MoviesAppColors.whiteColor,
//         fontSize: 14,
//       );

// }