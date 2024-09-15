import 'package:delivery_ka/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/models/payment_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select_clone/flutter_awesome_select.dart';
// import 'package:flutter_awesome_select/flutter_awesome_select.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentTypeModel> paymentTypes;
  final ValueChanged<int> valueChanged;
  final bool valid;
  final String valueSelected;

  const PaymentTypesField({
    super.key,
    required this.paymentTypes,
    required this.valueChanged,
    required this.valid,
    required this.valueSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forma de Pagamento',
            style: DeliveryKaTextStyles.textRegular.copyWith(
              fontSize: 16,
            ),
          ),
          SmartSelect.single(
            title: '',
            selectedValue: valueSelected,
            modalType: S2ModalType.bottomSheet,
            onChange: (selected) {
              valueChanged(int.parse(selected.value));
            },
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? '',
                            style: DeliveryKaTextStyles.textRegular,
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !valid,
                      child: const Divider(
                        color: DeliveryKaColors.redColor,
                      ),
                    ),
                    Visibility(
                      visible: !valid,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Selecione uma forma de pagamento',
                          style: DeliveryKaTextStyles.textRegular.copyWith(
                            fontSize: 13,
                            color: DeliveryKaColors.redColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom(
              source: paymentTypes
                  .map((p) => {'value': p.id.toString(), 'title': p.name})
                  .toList(),
              title: (index, item) => item['title'] ?? '',
              value: (index, item) => item['value'] ?? '',
              group: (index, item) => 'Selecione uma forma de pagamento',
            ),
            choiceType: S2ChoiceType.radios,
            choiceGrouped: true,
            modalFilter: false,
            placeholder: '',
          )
        ],
      ),
    );
  }
}
