import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/save_swip_widget.dart';

class AddressSection extends StatelessWidget {
  const AddressSection(
      {super.key,
      required this.formKey,
      required this.valueListenable,
      required this.swipNotifier});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final ValueNotifier<bool> swipNotifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress!.name = value;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.text),
              const SizedBox(height: 8),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress!.email = value;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 8),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress!.address =
                        value;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text),
              const SizedBox(height: 8),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress!.city = value;
                  },
                  hintText: 'المدينة',
                  textInputType: TextInputType.text),
              const SizedBox(height: 8),
              CustomTextFormField(
                  onSaved: (value) {
                    context
                        .read<OrderEntity>()
                        .shippingAddress!
                        .addressDetails = value;
                  },
                  hintText: 'رقم الطابق,رقم الشقة..',
                  textInputType: TextInputType.number),
              const SizedBox(height: 8),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress!.phoneNumber =
                        value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.number),
              const SizedBox(height: 12),
              SaveSwipWidget(
                swipNotifier: swipNotifier,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
