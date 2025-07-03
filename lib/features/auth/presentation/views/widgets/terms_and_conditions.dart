import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 36), // leaves space for checkbox on the right
            child: RichText(
              text: TextSpan(
                style: AppStyles.semiBold16.copyWith(
                  color: const Color(0xff949d9e),
                ),
                children: [
                  const TextSpan(text: 'من خلال إنشاء حساب، فإنك توافق على '),
                  TextSpan(
                    text: 'الشروط والأحكام الخاصة بنا',
                    style: AppStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.of(context).pushReplacementNamed(SignUpView.routeName);
                      },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 0, // checkbox now on right side
            child: SizedBox(
              height: 24,
              child: CustomCheckBox(
                isChecked: isTermsAccepted,
                onChecked: (value) {
                  isTermsAccepted = value;
                  //print('isTermsAccepted:$isTermsAccepted');
                  setState(() {});
                },
              ),
              // child: Checkbox(
              //   value: false,
              //   onChanged: (value) {},
              //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
