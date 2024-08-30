import 'package:delivery_ka/app/core/config/env/env.dart';
import 'package:delivery_ka/app/delivery_ka_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Env.i.load(); // vai carregar para o app todas as variáveis de ambiente
  runApp(const DeliveryKaApp());
}
