import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryKaIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryKaIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: DeliveryKaColors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '-',
                style: DeliveryKaTextStyles.textmedium
                    .copyWith(fontSize: 22, color: DeliveryKaColors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: DeliveryKaTextStyles.textRegular
                .copyWith(fontSize: 17, color: DeliveryKaColors.secondaryColor),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: DeliveryKaTextStyles.textmedium.copyWith(
                    fontSize: 22, color: DeliveryKaColors.secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}