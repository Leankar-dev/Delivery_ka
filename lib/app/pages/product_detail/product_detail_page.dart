import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_ka/app/core/extensions/formatter_extension.dart';
import 'package:delivery_ka/app/core/ui/base_state/base_state.dart';
import 'package:delivery_ka/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_increment_decrement_button.dart';
import 'package:delivery_ka/app/models/product_model.dart';
import 'package:delivery_ka/app/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryKaAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidht,
            height: context.percentHeight(.40),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.product.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.product.name,
              style: DeliveryKaTextStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              // colocar rolagem somente no texto da descrição
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                width: context.percentWidth(.50),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return DeliveryKaIncrementDecrementButton(
                      amount: amount,
                      incrementTap: () {
                        controller.increment();
                      },
                      decrementTap: () {
                        controller.decrement();
                      },
                    );
                  },
                ),
              ),
              Container(
                width: context.percentWidth(.50),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adicionar',
                            style: DeliveryKaTextStyles.textExtraBold.copyWith(
                              fontSize: 13,
                              color: DeliveryKaColors.whiteColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // usar o package autosizetext para ajustar o tamanho detro do botão de acordo com a quantidade de digitos.
                          // envolver ele em um Expanded
                          Expanded(
                            child: AutoSizeText(
                              (widget.product.price * amount).currencyPTPT,
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style:
                                  DeliveryKaTextStyles.textExtraBold.copyWith(
                                fontSize: 13,
                                color: DeliveryKaColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
