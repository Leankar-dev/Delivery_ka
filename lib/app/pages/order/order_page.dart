import 'package:delivery_ka/app/core/ui/base_state/base_state.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_button.dart';
import 'package:delivery_ka/app/core/ui/widgets/order_field_widget.dart';
import 'package:delivery_ka/app/core/ui/widgets/order_product_tile_widget.dart';
import 'package:delivery_ka/app/core/ui/widgets/payment_types_field.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:delivery_ka/app/models/product_model.dart';
import 'package:delivery_ka/app/pages/order/order_controller.dart';
import 'package:delivery_ka/app/pages/order/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryKaAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: DeliveryKaTextStyles.textTitle,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
            selector: (state) => state.orderProducts,
            builder: (context, orderProducts) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: orderProducts.length,
                  (context, index) {
                    final orderProduct = orderProducts[index];
                    return Column(
                      children: [
                        OrderProductTileWidget(
                          index: index,
                          orderProduct: orderProduct,
                        ),
                        const Divider(
                          color: DeliveryKaColors.grey,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do Pedido',
                        style: DeliveryKaTextStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        r'200,00 e',
                        style: DeliveryKaTextStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: DeliveryKaColors.greyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderFieldWidget(
                  title: 'Endereço de Entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('xxx'),
                  hintText: 'Digite um Endereço',
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderFieldWidget(
                  title: 'NIF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('xxx'),
                  hintText: 'Digite o NIF',
                ),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  color: DeliveryKaColors.grey,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DeliveryKaButton(
                    width: double.infinity,
                    height: 48,
                    label: 'FINALIZAR',
                    color: DeliveryKaColors.whiteColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
