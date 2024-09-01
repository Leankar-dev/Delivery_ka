import 'package:bloc/bloc.dart';
import 'package:delivery_ka/app/core/ui/helpers/loader.dart';
import 'package:delivery_ka/app/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// .todo mundo que extender BaseState já vai ter uma controller disponivel pra utilzar.

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        onReady();
      },
    );
  }

  void onReady() {}
}
