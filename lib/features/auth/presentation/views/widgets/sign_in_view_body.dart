import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/check_have_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 16,
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
            CheckHaveAccountWidget(
              notLinkedText: 'لا تمتلك حساب؟',
              linkedText: 'قم بإنشاء حساب',
              link: SignUpView.routeName,
            ),
            SizedBox(
              height: 33,
            ),
            OrDivider(),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              icon: AppImages.imagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              icon: AppImages.imagesAppleIcon,
              title: 'تسجيل بواسطة أبل',
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              icon: AppImages.imagesFaceBookIcon,
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
