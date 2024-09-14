import 'package:delivery_ka/app/core/extensions/formatter_extension.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_increment_decrement_button.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class OrderProductTileWidget extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTileWidget({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: DeliveryKaTextStyles.textRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price.currencyPTPT,
                        style: DeliveryKaTextStyles.textmedium.copyWith(
                          fontSize: 14,
                          color: DeliveryKaColors.secondaryColor,
                        ),
                      ),
                      DeliveryKaIncrementDecrementButton.compact(
                        amount: 1,
                        incrementTap: () {},
                        decrementTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
