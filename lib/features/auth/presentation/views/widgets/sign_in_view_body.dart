import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/check_have_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
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
              PasswordFormField(
                onSaved: (value) {
                  password = value!;
                },
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
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SignInCubit>()
                        .signInWithEmailAndPassword(email, password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
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
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('تم تسجيل الدخول بواسطة جوجل')),
                  //);
                },
              ),
              SizedBox(
                height: 16,
              ),
              // SocialLoginButton(
              //   icon: AppImages.imagesAppleIcon,
              //   title: 'تسجيل بواسطة أبل',
              //   onPressed: () {},
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              SocialLoginButton(
                icon: AppImages.imagesFaceBookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('تم تسجيل الدخول بواسطة فيسبوك')),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
