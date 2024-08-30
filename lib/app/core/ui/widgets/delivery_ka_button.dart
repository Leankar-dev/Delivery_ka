import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:flutter/material.dart';

class DeliveryKaButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const DeliveryKaButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
