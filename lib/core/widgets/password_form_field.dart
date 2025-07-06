import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        obscureText: obscureText,
        onSaved: widget.onSaved,
        suffixIcon: GestureDetector(
          onTap: () {
            obscureText = !obscureText;
            setState(() {});
          },
          child: obscureText
              ? Icon(Icons.remove_red_eye, color: Color(0xffc9cecf))
              : Icon(Icons.visibility_off, color: Color(0xffc9cecf)),
        ),
        hintText: 'كلمة المرور',
        textInputType: TextInputType.visiblePassword);
  }
}
