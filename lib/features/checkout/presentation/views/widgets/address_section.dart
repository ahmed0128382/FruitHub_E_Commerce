import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/save_swip_widget.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 16),
        CustomTextFormField(
            hintText: 'الاسم كامل', textInputType: TextInputType.text),
        SizedBox(height: 8),
        CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.emailAddress),
        SizedBox(height: 8),
        CustomTextFormField(
            hintText: 'العنوان', textInputType: TextInputType.text),
        SizedBox(height: 8),
        CustomTextFormField(
            hintText: 'المدينة', textInputType: TextInputType.text),
        SizedBox(height: 8),
        CustomTextFormField(
            hintText: 'رقم الطابق,رقم الشقة..',
            textInputType: TextInputType.number),
        SizedBox(height: 8),
        CustomTextFormField(
            hintText: 'رقم الهاتف', textInputType: TextInputType.number),
        SizedBox(height: 12),
        SaveSwipWidget(),
        SizedBox(height: 24),
      ],
    );
  }
}
