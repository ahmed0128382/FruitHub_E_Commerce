import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'تسجيل حساب جديد',
            style: AppStyles.bold19,
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInView.routeName);
                ();
              },
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
