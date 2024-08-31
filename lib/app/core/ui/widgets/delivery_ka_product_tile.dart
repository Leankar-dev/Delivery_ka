import 'package:delivery_ka/app/core/extensions/formatter_extension.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/models/product_model.dart';
import 'package:flutter/material.dart';

class DeliveryKaProductTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryKaProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style: DeliveryKaTextStyles.textExtraBold
                        .copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.description,
                    style:
                        DeliveryKaTextStyles.textLight.copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.price.currencyPTPT,
                    style: DeliveryKaTextStyles.textmedium.copyWith(
                      color: DeliveryKaColors.secondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
