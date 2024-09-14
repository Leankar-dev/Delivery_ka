import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_style.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(color: DeliveryKaColors.greyMedium),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: DeliveryKaColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: DeliveryKaColors.whiteColor,
      elevation: 1,
      centerTitle: true,
      iconTheme: IconThemeData(color: DeliveryKaColors.blackColor),
    ),
    primaryColor: DeliveryKaColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DeliveryKaColors.primaryColor,
      primary: DeliveryKaColors.primaryColor,
      secondary: DeliveryKaColors.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: DeliveryKaStyle.i.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: DeliveryKaColors.whiteColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      focusedErrorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: DeliveryKaColors.redErro),
      ),
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: DeliveryKaColors.redErro),
      ),
      labelStyle: DeliveryKaTextStyles.textRegular
          .copyWith(color: DeliveryKaColors.blackColor),
      errorStyle: DeliveryKaTextStyles.textRegular
          .copyWith(color: DeliveryKaColors.redErro),
    ),
  );
}
