import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_product_tile.dart';
import 'package:delivery_ka/app/models/product_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryKaAppbar(),
      body: Column(
        children: [
          // um ListView dentro de uma coluna dá erro. Por isso coloca o Expanded
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryKaProductTile(
                  product: ProductModel(
                      id: 0,
                      name: 'Brigadeiro Tradicional',
                      description: 'brigadeiro de chocolate ao leite',
                      price: 1.00,
                      image:
                          'https://www.marajoaraalimentos.com.br/2018/wp-content/uploads/2020/07/349-scaled.jpg'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
