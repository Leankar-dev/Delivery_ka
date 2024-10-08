import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:delivery_ka/app/pages/home/home_state.dart';
import 'package:delivery_ka/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository productsRepository;

  // iniciar o Cubit
  HomeController(this.productsRepository)
      : super(
          const HomeState.initial(),
        );

  // metodo que vai carregar os dados / vai copiar o estado anterior alterando somente o status dele
  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await productsRepository.findAllProducts();
      // throw Exception();
      // emitir um novo estado para colocar os produtos na tela
      emit(
        state.copyWith(status: HomeStateStatus.loaded, products: products),
      );
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos.'),
      );
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag.indexWhere(
      (orderP) => orderP.product == orderProduct.product,
    );

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
