// extension para usar o mediaquery - verificar o tamanho da tela.
// para facilitar o uso

import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidht => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => screenWidht * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
