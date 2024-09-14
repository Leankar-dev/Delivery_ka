import 'package:delivery_ka/app/core/extensions/formatter_extension.dart';
import 'package:delivery_ka/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_ka/app/core/ui/routes/get_routes.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryKaShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const DeliveryKaShoppingBagWidget({
    super.key,
    required this.bag,
  });

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      // envio para o login
      final loginResult = await navigator.pushNamed('/auth/login');

      if (loginResult == null || loginResult == false) {
        return;
      }
    }
    // envio para o order
    await navigator.pushNamed('/orderPage', arguments: bag);
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(
          0.0,
          (total, element) => total += element.totalPrice,
        )
        .currencyPTPT;

    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: DeliveryKaColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: DeliveryKaColors.greyMedium,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: DeliveryKaColors.whiteColor,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Carrinho',
                style: DeliveryKaTextStyles.textExtraBold
                    .copyWith(fontSize: 14, color: DeliveryKaColors.whiteColor),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: DeliveryKaTextStyles.textExtraBold
                    .copyWith(fontSize: 14, color: DeliveryKaColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
