import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.email,
                color: Color(0xffc9cecf),
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffc9cecf),
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: ' كلمة المرور',
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'نسيت كلمة المرور ؟',
              style: AppStyles.semiBold13.copyWith(
                color: AppColors.lightprimaryColor,
              ),
            ),
            SizedBox(
              height: 33,
            ),
            CustomButton(
              text: 'تسجيل الدخول',
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
            SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تمتلك حساب؟',
                  style: AppStyles.semiBold16.copyWith(
                    color: Color(0xff949d9e),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpView.routeName);
                  },
                  child: Text(
                    'قم بانشاء حساب',
                    style: AppStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
