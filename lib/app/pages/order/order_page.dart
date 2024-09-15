import 'package:delivery_ka/app/core/ui/base_state/base_state.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_button.dart';
import 'package:delivery_ka/app/core/ui/widgets/order_field_widget.dart';
import 'package:delivery_ka/app/core/ui/widgets/order_product_tile_widget.dart';
import 'package:delivery_ka/app/core/ui/widgets/payment_types_field.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:delivery_ka/app/models/payment_type_model.dart';
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
  final formKey = GlobalKey<FormState>();
  final addressEC = TextEditingController();
  final documentEC = TextEditingController();
  int? paymentTypeId;
  final paymentTypeValid = ValueNotifier<bool>(true);

  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader,
          error: () {
            hideLoader();
            showError(state.erroMessage ?? 'Erro não informado');
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryKaAppbar(),
        body: Form(
          key: formKey,
          child: CustomScrollView(
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
                      controller: addressEC,
                      validator: Validatorless.required('Endereço Obrigatorio'),
                      hintText: 'Digite um Endereço',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OrderFieldWidget(
                      title: 'NIF',
                      controller: documentEC,
                      validator:
                          Validatorless.required('Documento Obrigatorio'),
                      hintText: 'Digite o NIF',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocSelector<OrderController, OrderState,
                        List<PaymentTypeModel>>(
                      selector: (state) => state.paymentTypes,
                      builder: (context, paymentTypes) {
                        return ValueListenableBuilder(
                          valueListenable: paymentTypeValid,
                          builder: (_, paymentTypeValidValue, child) {
                            return PaymentTypesField(
                              paymentTypes: paymentTypes,
                              valueChanged: (value) {
                                paymentTypeId = value;
                              },
                              valid: paymentTypeValidValue,
                              valueSelected: paymentTypeId.toString(),
                            );
                          },
                        );
                      },
                    ),
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
                        onPressed: () {
                          final valid =
                              formKey.currentState?.validate() ?? false;
                          final paymentTypeSelected = paymentTypeId != null;
                          paymentTypeValid.value = paymentTypeSelected;

                          if (valid) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
